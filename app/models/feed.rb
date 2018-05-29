class Feed < GithubModels
  attr_reader :type, :created_at, :repo
  def initialize(data)
    @type = data[:type]
    @created_at = parse_for_reading(data[:created_at])
    @repo = data[:repo][:name]
  end
end
