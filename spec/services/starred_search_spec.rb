require 'rails_helper'

describe StarredSearch do
  subject { StarredSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username/starred')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/starred.json'))

      expect(subject).to be_a StarredSearch
    end
  end

  context 'instance methods' do
    context '#find_starred' do
      it 'should return an array of repository objects' do
        stub_request(:get, 'https://api.github.com/users/username/starred')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/starred.json'))

        expect(subject.find_starred).to be_an Array
        expect(subject.find_starred.first).to be_an Repository
      end
    end
  end
end
