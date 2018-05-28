class GithubUser < SimpleDelegator
  def gather_information
    @service ||= GithubService.gather_information(self)[:data][:viewer]
  end

  def full_name
    gather_information[:name]
  end

  def website
    gather_information[:websiteUrl]
  end

  def avatar_url
    gather_information[:avatarUrl]
  end

  def bio
    gather_information[:bio]
  end

  def location
    gather_information[:location]
  end

  def company
    gather_information[:company]
  end

  def pinned_repos
    gather_information[:pinnedRepositories][:edges].map do |raw_repo|
      Repository.new(raw_repo)
    end
  end

  def followers
    gather_information[:followers][:edges].map do |raw_info|
      Follower.new(raw_info)
    end
  end

  def following
    gather_information[:following][:edges].map do |raw_info|
      Follower.new(raw_info)
    end
  end

  def all_repos
    gather_information[:repositories][:edges].map do |raw_info|
      Repository.new(raw_info)
    end
  end

  def starred_repos
    gather_information[:starredRepositories][:edges].map do |raw_info|
      Repository.new(raw_info)
    end
  end

  def activity_feed
    v3_gather_information.map do |raw_info|
      Feed.new(raw_info)
    end
  end

  def v3_gather_information
    @v3_service ||= V3GithubService.gather_information(self)
  end
end
