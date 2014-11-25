class Router
  attr_accessor :name, :interfaces, :links, :process_time, :queue_sizes, :ips, :routing_table
  def initialize(name,interfaces)
    @name = name
    @interfaces = interfaces
    @links = Array.new(interfaces)
    @queue_sizes = Array.new(interfaces)
    @ips = Array.new(interfaces)
    @routing_table = Hash.new
  end
  
  def debug
    puts "Name: " + name
    
    puts "Number of interfaces: " + interfaces.to_s
    
    puts "Links:"
    links.each do |link|
      puts link
    end
    
    puts "Process time: " + process_time.to_s
    
    puts "Queue sizes:"
    queue_sizes.each do |size|
      puts size
    end
    
    puts "Ips:"
    ips.each do |ip|
      puts ip
    end
    
    routing_table.each do |key,value|
      
      puts "Redirect " + key + " to " + value
    end
  end
end
