class OverviewPresenter < ProfilePresenter
  def initialize(username)
    @username = username
  end

  def pinned_repos
    @repos ||= RepoSearch.new(@username).find_repositories[0..5]
  end
end
