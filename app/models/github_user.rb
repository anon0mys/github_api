class GithubUser
  attr_reader :login,
              :uid,
              :name,
              :bio,
              :avatar,
              :public_repos,
              :following,
              :followers

  def initialize(attrs)
    @login = attrs[:login]
    @uid = attrs[:id]
    @name = attrs[:name]
    @bio = attrs[:bio]
    @avatar = attrs[:avatar_url]
    @public_repos = attrs[:public_repos]
    @following = attrs[:following]
    @followers = attrs[:followers]
  end
end
