class Link
  attr_accessor :from, :to, :speed, :delay
  
  def debug
    if(from.nil?)
      puts "from eh nil"
      return
    end
    if(to.nil?)
      puts "to eh nil"
      return
    end
    puts "Link goes from " + from.name + " to " + to.name + "."
  end
end
