class FollowingSearch < GithubApiSearch
  def find_following
    raw_following = api_call('following')
    raw_following.map do |followed|
      GithubUser.new(followed)
    end
  end
end
