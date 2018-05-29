class Follower < GithubModels
  attr_reader :name, :bio, :location,
              :company, :login, :avatar_url
  def initialize(data)
    @name = determine_if_empty(data[:node][:name])
    @bio = determine_if_empty(data[:node][:bio])
    @location = determine_if_empty(data[:node][:location])
    @company = determine_if_empty(data[:node][:company])
    @login = data[:node][:login]
    @avatar_url = data[:node][:avatarUrl]
  end
end
