class GithubUserSearch < GithubApiSearch
  def find_user
    GithubUser.new(api_call)
  end
end
