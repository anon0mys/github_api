FactoryBot.define do
  factory :user do
    name 'Evan Wheeler'
    username 'anon0mys'
    uid '34108893'
    oauth_token ENV['GITHUB_USER_TOKEN']
  end
end
