class Follower
  attr_reader :name, :bio, :location,
              :company, :login, :avatar_url

  def initialize(data)
    @name = data[:node][:name].empty? ? "No name provided" : data[:node][:name]
    @bio = data[:node][:bio] == "" ? "No bio provided" : data[:node][:bio]
    @location = data[:node][:location].nil? ? "No location provided" : data[:node][:location]
    @company = data[:node][:company] == "" ? "No company provided" : data[:node][:company]
    @login = data[:node][:login]
    @avatar_url = data[:node][:avatarUrl]
  end
end
