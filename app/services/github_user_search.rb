class GithubUserSearch
  def initialize(login)
    @login = login
  end

  def find_user
    GithubUser.new(api_call)
  end

  private
    attr_reader :login

    def response
      conn = Faraday.new(url: "https://api.github.com/users/#{login}")
      conn.get do |req|
        req.headers['Authorization'] = "token #{ENV['GITHUB_USER_TOKEN']}"
      end
    end

    def api_call
      JSON.parse(response.body, symbolize_names: true)
    end
end
