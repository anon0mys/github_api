require 'rails_helper'

describe ProfilePresenter do
  subject { ProfilePresenter.new('username') }

  context 'attributes' do
    it 'initializes with a vaild user' do
      stub_request(:get, 'https://api.github.com/users/username')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

      expect(subject.user).to be_a GithubUser
    end
  end

  context 'instance methods' do
    context '#build_profile' do
      it 'creates an array of repositories when params includes repositories' do
        params = { tab: 'repositories', username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/repos')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

        expect(subject.build_profile(params)).to be_an Array
        expect(subject.build_profile(params).first).to be_a Repository
      end

      it 'creates an array of starred repositories when params includes starred' do
        params = { tab: 'stars', username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/starred')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/starred.json'))

        expect(subject.build_profile(params)).to be_an Array
        expect(subject.build_profile(params).first).to be_a Repository
      end

      it 'creates an array of followers when params includes followers' do
        params = { tab: 'followers', username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/followers')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/followers.json'))

        expect(subject.build_profile(params)).to be_an Array
        expect(subject.build_profile(params).first).to be_a GithubUser
      end

      it 'creates an array of followed users when params includes following' do
        params = { tab: 'following', username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/following')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/following.json'))

        expect(subject.build_profile(params)).to be_an Array
        expect(subject.build_profile(params).first).to be_a GithubUser
      end

      it 'creates an overview when there are no params' do
        params = { username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/repos')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

        stub_request(:get, 'https://api.github.com/users/username/events')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/events.json'))

        subject.build_profile(params)

        expect(subject.pinned_repos).to be_an Array
        expect(subject.pinned_repos.first).to be_a Repository
        expect(subject.pinned_repos.count).to eq(6)

        expect(subject.contributions).to be_an Array
        expect(subject.contributions.first).to be_an Event
      end
    end
  end
end
