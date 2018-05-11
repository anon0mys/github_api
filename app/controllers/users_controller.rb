class UsersController < ApplicationController
  def show
    @profile = ProfilePresenter.new(params[:username])
    @profile.build_profile(params)
  end
end
