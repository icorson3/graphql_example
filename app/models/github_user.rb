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

  def followers
    data[:followers][:edges].map do |raw_info|
      Follower.new(raw_info)
    end
  end

  def following
    data[:following][:edges].map do |raw_info|
      Follower.new(raw_info)
    end
  end

  def all_repos
    data[:repositories][:edges].map do |raw_info|
      Repository.new(raw_info)
    end
  end

  def starred_repos
    data[:starredRepositories][:edges].map do |raw_info|
      Repository.new(raw_info)
    end
  end
end
