class DashboardController < ApplicationController
  def show
    @repos = GithubUser.gather_information(current_user).repos
  end
end
