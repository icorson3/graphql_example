class DashboardController < ApplicationController
  def show
    info = GitHubUser.gather_information(current_user)
    @repos = info.repos
    @followers = info.followers
  end
end
