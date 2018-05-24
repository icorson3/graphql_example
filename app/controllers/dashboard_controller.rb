class DashboardController < ApplicationController
  def show
    @repos = ProfileInformation.new.repos
  end
#     # @repos =
#     resp = Faraday.post do |faraday|
#           faraday.url 'https://api.github.com/graphql'
#           faraday.headers["Authorization"] = "bearer #{current_user.token}"
#           faraday.body = request_body
#     end
#   end
#
#   def request_body
#     { query: "{
#   viewer {
#     repositories(first: 50) {
#       edges {
#         node {
#           id
#           name
#         }
#       }
#     }
#   }
# }"}.to_json
# end
end
