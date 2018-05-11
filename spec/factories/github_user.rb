FactoryBot.define do
  factory :github_user do
    login 'username'
    uid '123456'
    name 'User Name'
    bio 'This is a bio'
    avatar 'linktoathing'
    public_repos 10
    following 1
    followers 1
  end
end
