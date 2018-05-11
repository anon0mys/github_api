class FollowingSearch
  def initialize(username)
    @username = username
  end

  def find_following
    raw_following = api_call
    raw_following.map do |followed|
      GithubUser.new(followed)
    end
  end

  private
    attr_reader :username

  def response
    conn = Faraday.new(url: "https://api.github.com/users/#{username}/following")
    conn.get do |req|
      req.headers['Authorization'] = "token #{ENV['GITHUB_USER_TOKEN']}"
    end
  end

  def api_call
    JSON.parse(response.body, symbolize_names: true)
  end
end
