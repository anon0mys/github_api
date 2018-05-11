class GithubApiSearch
  def initialize(username)
    @username = username
  end

  private
    attr_reader :username

    def response(endpoint = nil)
      path = "https://api.github.com/users/#{username}"
      path += ('/' + endpoint) unless endpoint.nil?
      conn = Faraday.new(url: path)
      conn.get do |req|
        req.headers['Authorization'] = "token #{ENV['GITHUB_USER_TOKEN']}"
      end
    end

    def api_call(endpoint = nil)
      JSON.parse(response(endpoint).body, symbolize_names: true)
    end
  end
