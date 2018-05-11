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

      it 'creates an array of followers when params includes followers' do
        params = { tab: 'followers', username: 'username' }
        stub_request(:get, 'https://api.github.com/users/username')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/profile_with_bio.json'))

        stub_request(:get, 'https://api.github.com/users/username/followers')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/followers.json'))

        expect(subject.build_profile(params)).to be_an Array
        expect(subject.build_profile(params).first).to be_a GithubUser
      end
    end
  end
end
