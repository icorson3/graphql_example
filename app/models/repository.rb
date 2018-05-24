class Repository
  attr_reader :name, :owner, :forks
  def initialize(raw_data)
    @name = raw_data[:node][:name]
    @owner = raw_data[:node][:owner][:login]
    @forks = raw_data[:node][:forkCount]
  end
end
