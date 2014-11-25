class Host
  attr_accessor :name, :ip, :default_gateway, :dns, :agent
  def initialize(name)
    @name = name
  end
end
