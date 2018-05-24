class ProfileInformation

  def initialize(user)
    @user = user
  end
  def repos
        # @repos =
        resp = Faraday.post do |faraday|
              faraday.url 'https://api.github.com/graphql'
              faraday.headers["Authorization"] = "bearer #{@user.token}"
              faraday.body = request_body
        end
        u = JSON.parse(resp.body, symbolize_names: true)[:data][:viewer][:repositories][:edges]
        u.map do |raw_repo|
          Repository.new(raw_repo)
        end

      end

      def request_body
        { query: "{
      viewer {
        repositories(first: 50) {
          edges {
            node {
              id
              name
            }
          }
        }
      }
    }"}.to_json
  end

  private
  attr_reader :user
end
