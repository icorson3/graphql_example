class Repository < GithubModels
  attr_reader :name, :owner, :forks, :language,
              :stargazers, :is_fork, :description,
              :updated_at

  alias_method :is_fork?, :is_fork
  def initialize(raw_data)
    @name = raw_data[:node][:name]
    @forks = raw_data[:node][:forkCount]
    @language = raw_data[:node][:languages][:edges].blank? ? "" : raw_data[:node][:languages][:edges].first[:node][:name]
    @stargazers = count_stargazers(raw_data[:node][:stargazers][:edges])
    @is_fork = raw_data[:node][:isFork]
    @description = determine_if_empty(raw_data[:node][:description])
    @updated_at = parse_for_reading(raw_data[:node][:updatedAt])
    @owner = raw_data[:node][:owner][:login]
  end

  def count_stargazers(stargazers)
    stargazers.count
  end
end
