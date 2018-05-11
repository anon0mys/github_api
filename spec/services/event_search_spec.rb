require 'rails_helper'

describe EventSearch do
  subject { EventSearch.new('username') }

  context 'attributes' do
    it 'initializes with a username' do
      stub_request(:get, 'https://api.github.com/users/username/events')
        .to_return(status: 200, body: File.read('./spec/fixtures/json/events.json'))

      expect(subject).to be_a EventSearch
    end
  end

  context 'instance methods' do
    context '#find_events' do
      it 'should return an array of event objects' do
        stub_request(:get, 'https://api.github.com/users/username/events')
          .to_return(status: 200, body: File.read('./spec/fixtures/json/events.json'))

        expect(subject.find_events).to be_an Array
        expect(subject.find_events.first).to be_an Event
      end
    end
  end
end
