class DashboardController < ApplicationController
  def show
    info = GithubUser.gather_information(current_user)
    @pinned_repos = info.repos
    @followers = info.followers
    @following = info.following
    @all_repos = info.all_repos
  end
end
