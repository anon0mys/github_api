require 'rails_helper'

describe GithubUserSearch do
  subject { GithubUserSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      expect(subject).to be_a GithubUserSearch
    end
  end

  context 'instance methods' do
    context '#find_user' do
      it 'should return a user profile object' do
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        expect(subject.find_user).to be_a GithubUser
      end
    end
  end
end
