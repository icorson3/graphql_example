class Repository
  attr_reader :name, :owner, :forks, :language, :stargazers, :is_fork, :description, :updated_at
  alias_method :is_fork?, :is_fork
  def initialize(raw_data)
    # binding.pry
    @name = raw_data[:node][:name]
    @forks = raw_data[:node][:forkCount]
    @language = raw_data[:node][:languages][:edges].empty? ? "" : raw_data[:node][:languages][:edges].first[:node][:name]
    @stargazers = count_stargazers(raw_data[:node][:stargazers][:edges])
    @is_fork = raw_data[:node][:isFork]
    @description = raw_data[:node][:description]
    @updated_at = DateTime.parse(raw_data[:node][:updatedAt]).strftime("%b %-d, %Y")
  end

  def count_stargazers(stargazers)
    stargazers.count
  end
end
