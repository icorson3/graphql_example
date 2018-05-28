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
        name
        location
        websiteUrl
        avatarUrl
        bio
        company
        repositories(first: 100,  orderBy: {field: UPDATED_AT, direction: DESC}, affiliations: OWNER) {
          edges {
            node {
              name
              updatedAt
            	isFork
              forkCount
              description
              owner {
                login
              }
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
        starredRepositories(first: 100, orderBy:{field: STARRED_AT, direction: DESC}) {
          edges {
            node {
              name
              updatedAt
              isFork
              forkCount
              owner {
                login
              }
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
        pinnedRepositories(first: 6) {
          edges {
            node {
              name
              updatedAt
            	isFork
              forkCount
              description
              owner {
                login
              }
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
              login
              avatarUrl
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
              login
              avatarUrl
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
