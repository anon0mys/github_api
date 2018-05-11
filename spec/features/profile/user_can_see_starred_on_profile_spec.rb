require 'rails_helper'

feature 'On the Profile page Starred tab' do
  context 'a user' do
    scenario 'can see a list of their starred repositories' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/starred')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/starred.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      click_on 'Stars'

      expect(current_url).to include('tab=stars')
      expect(page).to have_css('.starred-item')
    end
  end
end
