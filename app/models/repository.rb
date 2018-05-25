class Repository
  attr_reader :name, :owner, :forks, :stargazers, :languages
  def initialize(raw_data)
    @name = raw_data[:node][:name]
    @forks = raw_data[:node][:forkCount]
    @stargazers = raw_data[:node][:stargazers]
    @languages = raw_data[:node][:languages]
  end
end
