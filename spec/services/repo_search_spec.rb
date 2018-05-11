require 'rails_helper'

describe RepoSearch do
  subject { RepoSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username/repos')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

      expect(subject).to be_a RepoSearch
    end
  end

  context 'instance methods' do
    context '#find_repositories' do
      it 'should return an array of repository objects' do
        stub_request(:get, 'https://api.github.com/users/username/repos')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/repos.json'))

        expect(subject.find_repositories).to be_an Array
        expect(subject.find_repositories.first).to be_an Repository
      end
    end
  end
end
