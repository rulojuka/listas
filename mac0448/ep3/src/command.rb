class Command
  attr_accessor :time, :from_name, :message, :to_name
  def initialize(time,from_name,message,to_name)
    @time = time
    @from_name = from_name
    @message = message
    @to_name = to_name
  end
  
  def debug
    puts "Time: " + @time
    puts "From name: " + @from_name
    puts "Message: " + @message
    puts "To name: " + @to_name
  end
end
