class GithubService
  def initialize(user)
    @user = user
  end

  def self.gather_information(user)
    info = new(user).establish_connection
    JSON.parse(info.body, symbolize_names: true)
  end

  def establish_connection
    Faraday.post do |faraday|
      faraday.url 'https://api.github.com/graphql'
      faraday.headers["Authorization"] = "bearer #{@user.token}"
      faraday.body = query
    end
  end

private

  def query
    {query: "{
      viewer {
        id
        name
        avatarUrl
        bio
        company
        pinnedRepositories(first: 6) {
          edges {
            node {
              name
              forkCount
              stargazers(first: 10) {
                edges {
                  node {
                    login
                  }
                }
              }
              languages(first: 1) {
                edges {
                  node {
                    name
                  }
                }
              }
            }
          }
        }
        followers(first: 10) {
          edges {
            node {
              name
              bio
              company
              location
            }
          }
        }
        following(first: 10) {
          edges {
            node {
              name
              bio
              company
              location
            }
          }
        }
      }
      }"}.to_json
  end
end
