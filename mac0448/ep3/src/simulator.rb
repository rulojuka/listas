class Simulator
  def initialize(file)
		@file = File.open(file, 'r')
		simulate
  end
  
  def simulate
    while line = @file.gets
      action = line.partition(" ").first
      arguments = line.partition(" ").last
      if action == "set"
        name = arguments.partition(" ").first
        node = arguments.partition(" ").last
        create_node(name,node)
      elsif action == "$simulator"
        simulate_action(arguments)
      end
    end
  end
  
  def create_node(name,arguments)
    if (arguments =~ /host/)
      puts "criando host " + name
    elsif (arguments =~ /router/)
      number_of_interfaces = arguments[/[[:digit:]]+/].to_i
      puts "criando router " + name + " com " + number_of_interfaces.to_s + " interfaces."
    elsif (arguments =~ /HTTPClient/)
			puts "criando cliente http " + name
		elsif (arguments =~ /HTTPServer/)
			puts "criando server http " + name
    elsif (arguments =~ /FTPClient/)
			puts "criando cliente ftp " + name
		elsif (arguments =~ /FTPServer/)
			puts "criando server ftp " + name
		elsif (arguments =~ /DNSServer/)
			puts "criando server dns " + name
		elsif (arguments =~ /Sniffer/)
      puts "criando sniffer " + name
    end
  end
  
  def simulate_action(arguments)
    puts "os argumentos sao " + arguments
  end
end
