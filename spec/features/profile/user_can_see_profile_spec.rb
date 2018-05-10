require 'rails_helper'

feature 'On a User Profile Page' do
  context 'a user' do
    scenario 'can see information about their account' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      expect(page).to have_content(user.name)
      expect(page).to have_content(user.username)
      expect(page).to have_css('.avatar')
    end

    context 'without a bio' do
      scenario 'can see a button to add a bio' do
        stub_request(:get, 'https://api.github.com/users/anon0mys')
          .to_return(body: File.read('./spec/fixtures/json/profile_without_bio.json'))

        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/#{user.username}"

        expect(page).to have_content('Add Bio')
      end
    end

    context 'with a bio' do
      scenario 'can see thier bio' do
        stub_request(:get, 'https://api.github.com/users/anon0mys')
          .to_return(body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/#{user.username}"

        expect(page).to_not have_content('Add Bio')
        expect(page).to have_content('This is a bio')
      end
    end

    scenario 'can see a count of associations' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      within '.profile-links' do
        expect(page).to have_content 'Repositories'
        expect(page).to have_content 'Stars'
        expect(page).to have_content 'Followers'
        expect(page).to have_content 'Following'
      end

      expect(page).to have_css('.counter', count: 3)
    end
  end
end
