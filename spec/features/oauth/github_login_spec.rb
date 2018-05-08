require 'rails_helper'
require './spec/support/omniauth.rb'

feature 'Github OAuth Login' do
  context 'A User' do
    scenario 'can login through Github' do
      visit '/'

      click_on 'Login with Github'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome, Test User!')
      expect(page).to have_content('Log Out')
    end
  end
end
