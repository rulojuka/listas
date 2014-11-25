require './host'
require './router'
require './dns_server'
require './http_server'
require './http_client'
require './sniffer'
require './link'
require './command'

class Simulator
  def initialize(file)
		@file = File.open(file, 'r')
		@hosts = Hash.new
		@routers = Hash.new
		@dns_servers = Hash.new
	  @http_servers = Hash.new
	  @http_clients = Hash.new
		@sniffers = Hash.new
		@links = Array.new
		@commands = Array.new
  end
  
  def simulate
    while line = @file.gets
      action = line.partition(" ").first
      arguments = line.partition(" ").last
      begin
        if action == "set"
          name = arguments.partition(" ").first
          entity = arguments.partition(" ").last
    		    create_entity(name,entity)
        elsif action == "$simulator"
          simulate_action( arguments.gsub("$", " ").split(" ") )
        end
      rescue Exception => e
        puts e.message
      end
    end
    execute
  end
  
  def execute
    
  end
  
  def debug
    puts "Routers debug:"
    @routers.each do |key,value|
      value.debug
    end
    
    puts "Links debug:"
    @links.each do |link|
      link.debug
    end
    
    puts "Commands debug:"
    @commands.each do |command|
      command.debug
    end
  end

  def create_entity(name,arguments)
    if (arguments =~ /host/)
      @hosts[name] = Host.new(name)
    elsif (arguments =~ /router/)
      number_of_interfaces = arguments[/[[:digit:]]+/].to_i
      @routers[name] = Router.new(name,number_of_interfaces)
		elsif (arguments =~ /DNSServer/)
      @dns_servers[name] = DNSServer.new(name)
    elsif (arguments =~ /HTTPServer/)
      @http_servers[name] = HTTPServer.new(name)
    elsif (arguments =~ /HTTPClient/)
      @http_clients[name] = HTTPClient.new(name)
		elsif (arguments =~ /Sniffer/)
      @sniffers[name] = Sniffer.new(name)
    else
      raise "Not implemented yet." #FTP server and client
    end
  end
  
  def simulate_action(arguments)
    if( arguments.first == "duplex-link" )
      node1 = arguments[1];
      node2 = arguments[2];
      speed = arguments[3].to_i; #Ruby's to_i takes care of the "Mbps"
      delay = arguments[4].to_i;
      create_duplex_link(node1, node2, speed, delay)
    elsif( arguments.first == "attach-agent" )
      if( is_a_sniffer?( arguments[1]) )
        sniffer = @sniffers[arguments[1]]
        sniffer.file_path = arguments[4].gsub("\"", "")
        
        from_name = arguments[2].split(".").first
        to_name = arguments[3].split(".").first
        
        from = is_a_host?(from_name) ? @hosts[from_name] : @routers[from_name]
        to = is_a_host?(to_name) ? @hosts[to_name] : @routers[to_name]
        
        forward_link = @links.select { |link| link.from == from and link.to == to}.first
        backward_link = @links.select { |link| link.from == to and link.to == from}.first
        
        sniffer.forward_link = forward_link
        sniffer.backward_link = backward_link
        
      else
        agent_name = arguments[1]
        host_name = arguments[2]
        if( is_a_dns_server?(agent_name) )
          @hosts[host_name].agent = @dns_servers[agent_name]
        elsif( is_a_http_server?(agent_name) )
          @hosts[host_name].agent = @http_servers[agent_name]
        elsif( is_a_http_client?(agent_name) )
          @hosts[host_name].agent = @http_clients[agent_name]
        else
          raise "Not implemented yet."
        end
      end
    elsif( arguments.first == "at" )
      if(arguments[2] =~ /finish/)
        puts "finish"
      else
        time = arguments[1]
        agent_name = arguments[2].gsub("\"", "")
        command = arguments[3]
        to_name = arguments[4].gsub("\"", "")
        
        selected_host = @hosts.select { |key,value| value.agent.name == agent_name }
        from_name = nil
        selected_host.each_key{ |key| from_name = key }
        
        command = Command.new(time,from_name,command,to_name)
        @commands << command
      end
    else
      if( is_a_host?( arguments[0]) ) 
        host = arguments[0]
        ip = arguments[1]
        default_gateway = arguments[2]
        dns = arguments[3]
        configure_host(host,ip,default_gateway,dns)
      else
        configure_router(arguments)
      end
    end
  end

  private
  
  def is_a_router?(node)
    (node.include? ".") ? true : false
  end
  
  def is_a_host?(node)
    @hosts[node]!=nil
  end
  
  def is_a_sniffer?(node)
    @sniffers[node]!=nil
  end
  
  def is_a_dns_server?(node)
    @dns_servers[node]!=nil
  end
  
  def is_a_http_server?(node)
    @http_servers[node]!=nil
  end

  def is_a_http_client?(node)
    @http_clients[node]!=nil
  end
  
  def create_duplex_link(node1, node2, speed, delay)
    x = Link.new() # Logical link from node1 to node2
    y = Link.new() # Logical link from node2 to node1

    if( is_a_router?(node1) )
      router = node1.split(".").first
      interface = node1.split(".").last.to_i
      x.from = @routers[router]
      y.to   = @routers[router]
      @routers[router].links[interface] = x;
    else
      x.from = @hosts[node1]
      y.to   = @hosts[node1]
    end
    
    if( is_a_router?(node2) )
      router = node2.split(".").first
      interface = node2.split(".").last.to_i
      y.from = @routers[router]
      x.to   = @routers[router]
      @routers[router].links[interface] = y;
    else
      y.from = @hosts[node2]
      x.to   = @hosts[node2]
    end
    
    x.speed = y.speed = speed
    x.delay = y.delay = delay 
    
    @links << x
    @links << y
  end
  
  def configure_host(host_name,ip,default_gateway,dns)
    host = @hosts[host_name]
    host.ip = ip
    host.default_gateway = default_gateway
    host.dns = dns
  end
  
  def configure_router(arguments)
    router = @routers[arguments[0]]
    if( arguments[1] == "route" ) #Router's routing table
      arguments.delete("\\")
      i = 2
      while i < arguments.size
        redirect_from = arguments[i]
        redirect_to = arguments[i+1]
        router.routing_table[ redirect_from ] = redirect_to
        i = i+2
      end
    elsif( arguments[1] == "performance" )  #Interfaces performance settings
      router.process_time = arguments[2].to_i
      for i in 0..(router.interfaces-1)
        index = 3 + 2*i
        interface = arguments[index].to_i
        queue_size = arguments[index+1].to_i
        router.queue_sizes[interface] = queue_size
      end
    else #Interfaces ip settings
      for i in 0..(router.interfaces-1)
        index = 1 + 2*i
        interface = arguments[index].to_i
        ip_address = arguments[index+1]
        router.ips[interface] = ip_address
      end
    end
  end
  
end
