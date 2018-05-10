class UsersController < ApplicationController
  def show
    @profile = UserSearch.new(params[:username]).user_info
  end
end

class UserSearch
  def initialize(username)
    @username = username
  end

  def user_info
    GitHubUser.new(make_request)
  end

  def make_request
    conn = Faraday.new(url: "https://api.github.com/users/#{username}")
    response = conn.get do |req|
      req.headers['Authentication'] = "token #{ENV['GITHUB_USER_TOKEN']}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :username
end

class GitHubUser
  attr_reader :username, :name, :avatar

  def initialize(attrs)
    @username = attrs[:login]
    @name = attrs[:name]
    @avatar = attrs[:avatar_url]
  end
end
