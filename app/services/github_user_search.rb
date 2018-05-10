class GithubUserSearch
  def initialize(login)
    @login = login
  end

  def find_user
    GithubUser.new(profile_info)
  end

  private
    attr_reader :login

    def response
      conn = Faraday.new(url: "https://api.github.com/users/#{login}")
      conn.get do |req|
        req.headers['Authentication'] = "token #{ENV['GITHUB_USER_TOKEN']}"
      end
    end

    def profile_info
      JSON.parse(response.body, symbolize_names: true)
    end
end
