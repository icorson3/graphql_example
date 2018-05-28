class Feed
  attr_reader :type, :created_at, :repo
  def initialize(data)
    @type = data[:type]
    @created_at = DateTime.parse(data[:created_at]).strftime("%b %-d, %Y")
    @repo = data[:repo][:name]
  end
end
