class FollowerSearch < GithubApiSearch
  def find_followers
    raw_followers = api_call('followers')
    raw_followers.map do |follower|
      GithubUser.new(follower)
    end
  end
end
