class GithubUser
  attr_reader :data
  def initialize(data)
    @data = data[:data][:viewer]
  end

  def self.gather_information(user)
    data = GithubService.gather_information(user)
    new(data)
  end

  def repos
    data[:pinnedRepositories][:edges].map do |raw_repo|
      Repository.new(raw_repo)
    end
  end
end
