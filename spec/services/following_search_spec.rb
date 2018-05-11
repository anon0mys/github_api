require 'rails_helper'

describe FollowingSearch do
  subject { FollowingSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username/following')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/following.json'))

      expect(subject).to be_a FollowingSearch
    end
  end

  context 'instance methods' do
    context '#find_following' do
      it 'should return an array of github user objects' do
        stub_request(:get, 'https://api.github.com/users/username/following')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/following.json'))

        expect(subject.find_following).to be_an Array
        expect(subject.find_following.first).to be_an GithubUser
      end
    end
  end
end
