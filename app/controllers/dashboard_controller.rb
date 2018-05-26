class DashboardController < ApplicationController
  def show
    @repos = GithubUser.gather_information(current_user).repos
    @followers = GithubUser.gather_information(current_user).followers
  end
end
