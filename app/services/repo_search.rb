class RepoSearch < GithubApiSearch
  def find_repositories
    raw_repos = api_call('repos')
    repos = raw_repos.map do |repo|
      Repository.new(repo)
    end
    date_sort(repos)
  end

  private
    def date_sort(repos)
      repos.sort_by do |repo|
        repo.updated_at
      end.reverse
    end
end
