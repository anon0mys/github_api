require 'rails_helper'

describe FollowerSearch do
  subject { FollowerSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username/followers')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/followers.json'))

      expect(subject).to be_a FollowerSearch
    end
  end

  context 'instance methods' do
    context '#find_followers' do
      it 'should return an array of github user objects' do
        stub_request(:get, 'https://api.github.com/users/username/followers')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/followers.json'))

        expect(subject.find_followers).to be_an Array
        expect(subject.find_followers.first).to be_an GithubUser
      end
    end
  end
end
