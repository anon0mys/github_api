require 'rails_helper'

feature 'On the Profile page Overview tab' do
  context 'a user' do
    scenario 'can see a list of pinned repositories' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/repos')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/events')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/events.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      expect(current_path).to eq('/anon0mys')
      expect(page).to have_css('.pinned-item')
    end

    scenario 'can see a list of contributions' do
      stub_request(:get, 'https://api.github.com/users/anon0mys')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/repos')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

      stub_request(:get, 'https://api.github.com/users/anon0mys/events')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/events.json'))

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/#{user.username}"

      expect(page).to have_css('.contribution-item', count: 20)
    end
  end
end
