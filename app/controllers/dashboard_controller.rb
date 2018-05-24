class DashboardController < ApplicationController
  def show
    @repos = ProfileInformation.new(current_user).repos
  end
end
