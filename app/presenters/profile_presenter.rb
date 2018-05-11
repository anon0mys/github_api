class ProfilePresenter
  attr_reader :user, :repos, :followers

  def initialize(username)
    @user ||= GithubUserSearch.new(username).find_user
  end

  def build_profile(params)
    api_call = params[:tab]
    case api_call
    when 'repositories'
      @repos ||= RepoSearch.new(params[:username]).find_repositories
    when 'followers'
      @followers ||= FollowerSearch.new(params[:username]).find_followers
    end
  end
end
