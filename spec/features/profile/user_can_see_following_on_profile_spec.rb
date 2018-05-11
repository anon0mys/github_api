require 'rails_helper'

feature 'On the Profile page Following tab' do
  context 'a user' do
    scenario 'can see a list of users they follow' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/following')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/following.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      click_on 'Following'

      expect(current_url).to include('tab=following')
      expect(page).to have_css('.following-item')
    end
  end
end
