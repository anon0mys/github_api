require 'rails_helper'

feature 'Github OAuth Login' do
  context 'A User' do
    scenario 'can login through Github' do
      visit '/'

      click_on 'Sign in'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome, Test User!')
      expect(page).to have_content('Log Out')
    end
  end
end
