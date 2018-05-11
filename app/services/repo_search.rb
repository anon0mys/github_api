class RepoSearch
  def initialize(username)
    @username = username
  end

  def find_repositories
    raw_repos = api_call
    repos = raw_repos.map do |repo|
      Repository.new(repo)
    end
    date_sort(repos)
  end

  private
    attr_reader :username

    def response
      conn = Faraday.new(url: "https://api.github.com/users/#{username}/repos")
      conn.get do |req|
        req.headers['Authorization'] = "token #{ENV['GITHUB_USER_TOKEN']}"
      end
    end

    def api_call
      JSON.parse(response.body, symbolize_names: true)
    end

    def date_sort(repos)
      repos.sort_by do |repo|
        repo.updated_at
      end.reverse
    end
end
