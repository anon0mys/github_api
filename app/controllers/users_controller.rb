class UsersController < ApplicationController
  def show
    @profile = GithubUserSearch.new(params[:username]).find_user
  end
end
