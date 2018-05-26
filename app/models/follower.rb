class Follower
  attr_reader :name, :bio, :location, :company
  def initialize(data)
    @name = data[:node][:name]
    @bio = data[:node][:bio]
    @location = data[:node][:location]
    @company = data[:node][:company]
  end

end
