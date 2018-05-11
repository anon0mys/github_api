require 'rails_helper'

feature 'On the Profile page Followers tab' do
  context 'a user' do
    scenario 'can see a list of their followers' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/followers')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/followers.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      click_on 'Followers'

      expect(current_url).to include('tab=followers')
      expect(page).to have_css('.follower-item')
    end
  end
end
