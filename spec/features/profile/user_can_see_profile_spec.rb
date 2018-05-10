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

    scenario 'can see a count of associations' do
      stub_request(:get, 'https://api.github.com/anon0mys')
        .with(body: File.read('./spec/fixtures/json/user_profile.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      within '.profile-links' do
        expect(page).to have_content 'Repositories'
        expect(page).to have_content 'Stars'
        expect(page).to have_content 'Followers'
        expect(page).to have_content 'Following'
      end

      expect(page).to have_css('.counter', count: 4)
    end
  end
end
