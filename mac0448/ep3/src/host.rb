class Host
  attr_accessor :ip, :default_gateway, :dns
  def initialize(name)
    @name = name
  end
end
