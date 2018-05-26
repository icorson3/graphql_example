class Repository
  attr_reader :name, :owner, :forks, :language, :stargazers
  def initialize(raw_data)
    @name = raw_data[:node][:name]
    @forks = raw_data[:node][:forkCount]
    @language = raw_data[:node][:languages][:edges].first[:node][:name]
    @stargazers = count_stargazers(raw_data[:node][:stargazers][:edges])
  end

  def count_stargazers(stargazers)
    stargazers.count
  end
end
