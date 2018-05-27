class DashboardController < ApplicationController
  def show
    @user = GithubUser.new(current_user)
  end
end
