class ProfilePresenter
  attr_reader :user,
              :repos,
              :followers,
              :following,
              :starred,
              :pinned_repos,
              :contributions

  def initialize(username)
    @user ||= GithubUserSearch.new(username).find_user
  end

  def build_profile(params)
    api_call = params[:tab]
    case api_call
    when 'repositories'
      @repos ||= RepoSearch.new(params[:username]).find_repositories
    when 'stars'
      @starred ||= StarredSearch.new(params[:username]).find_starred
    when 'followers'
      @followers ||= FollowerSearch.new(params[:username]).find_followers
    when 'following'
      @following ||= FollowingSearch.new(params[:username]).find_following
    else
      @pinned_repos ||= RepoSearch.new(params[:username]).find_repositories[0..5]
      @contributions ||= EventSearch.new(params[:username]).find_events
    end
  end

  def star_count
    StarredSearch.new(@user.login).find_starred.count
  end
end
