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
        #{user_info}
        websiteUrl
        #{all_repos}
        #{starred_repos}
        #{pinned_repos}
        #{followers}
        #{following}
      }
      }"}.to_json
  end

  def all_repos
    "repositories(first: 100,  orderBy: {field: UPDATED_AT, direction: DESC}, affiliations: OWNER) {
      #{repo_edges}
    }"
  end

  def starred_repos
    "starredRepositories(first: 100, orderBy:{field: STARRED_AT, direction: DESC}) {
      #{repo_edges}
    }"
  end

  def pinned_repos
    "pinnedRepositories(first: 6) {
      #{repo_edges}
    }"
  end

  def languages
    "languages(first: 1) {
      edges {
        node {
          name
        }
      }
    }"
  end

  def repo_edges
    "edges {
      node {
        name
        updatedAt
        isFork
        forkCount
        description
        #{owner}
        #{stargazers}
        #{languages}
      }
    }"
  end

  def owner
    "owner {
      login
    }"
  end

  def stargazers
    "stargazers(first: 10) {
      edges {
        node {
          login
        }
      }
    }"
  end

  def user_info
    "name
    location
    avatarUrl
    bio
    company"
  end

  def followers
    "followers(first: 10) {
      #{follower_edges}
    }"
  end

  def following
    "following(first: 10) {
      #{follower_edges}
    }"
  end

  def follower_edges
    "edges {
      node {
        login
        #{user_info}
      }
    }"
  end
end
