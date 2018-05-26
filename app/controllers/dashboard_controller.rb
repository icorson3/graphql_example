class DashboardController < ApplicationController
  def show
    info = GithubUser.gather_information(current_user)
    @repos = info.repos
    @followers = info.followers
    @following = info.following
  end
end
