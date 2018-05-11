class FollowerSearch
  def initialize(username)
    @username = username
  end

  def find_followers
    raw_followers = api_call
    raw_followers.map do |follower|
      GithubUser.new(follower)
    end
  end

  private
    attr_reader :username

  def response
    conn = Faraday.new(url: "https://api.github.com/users/#{username}/followers")
    conn.get do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_USER_TOKEN']}"
    end
  end

  def api_call
    JSON.parse(response.body, symbolize_names: true)
  end
end
