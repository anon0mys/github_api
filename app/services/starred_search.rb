class StarredSearch < GithubApiSearch
  def find_starred
    raw_repos = api_call('starred')
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
