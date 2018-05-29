class V3GithubService
  def initialize(user)
    @user = user
  end

  def self.gather_information(user)
    new(user).activity_feed
  end

  def activity_feed
    response = Faraday.get("https://api.github.com/users/#{@user.username}/events/public")
    JSON.parse(response.body, symbolize_names: true)
  end
end
