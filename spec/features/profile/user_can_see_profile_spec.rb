require 'rails_helper'

feature 'On a User Profile Page' do
  context 'a user' do
    scenario 'can see information about their account' do
      stub_request(:get, 'https://api.github.com/anon0mys')
        .with(body: File.read('./spec/fixtures/json/user_profile.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      expect(page).to have_content(user.name)
      expect(page).to have_content(user.username)
      expect(page).to have_css('.avatar')
    end
  end
end
