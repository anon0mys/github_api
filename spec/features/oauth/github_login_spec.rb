require 'rails_helper'

feature 'Github OAuth Login' do
  context 'A User' do
    scenario 'can login through Github' do
      visit '/'

      click_on 'Sign in'

      expect(current_path).to eq(root_path)
      expect(page).to have_css('.profile-dropdown')
      within('.profile-dropdown') do
        expect(page).to have_content('Signed in as')
        expect(page).to have_content('Sign out')
      end
    end
  end
end
