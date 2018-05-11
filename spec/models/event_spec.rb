require 'spec_helper'
require './app/models/event'

describe Event do
  let(:attributes) {
    {
      type: 'Event',
      repo: { name: 'username/repo' },
      created_at: '2018-04-03'
    }
  }

  subject { Event.new(attributes) }

  context 'attributes' do
    it 'initializes with valid attributes' do
      expect(subject.type).to eq(attributes[:type])
      expect(subject.repo).to eq(attributes[:repo][:name])
      expect(subject.created_at).to eq(attributes[:created_at])
    end
  end
end
