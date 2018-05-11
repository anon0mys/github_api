require 'rails_helper'

describe Repository do
  let(:attributes) {
    {
      name: "Repository",
      language: 'ruby',
      updated_at: '2018-04-30',
      stargazers_count: 2,
      forks_count: 9,
      description: 'A description of the repo'
    }
  }
  subject { Repository.new(attributes) }

  context 'attributes' do
    it 'initializes with valid attributes' do
      expect(subject.name).to eq(attributes[:name])
      expect(subject.language).to eq(attributes[:language])
      expect(subject.updated_at).to eq(attributes[:updated_at])
      expect(subject.stargazers_count).to eq(attributes[:stargazers_count])
      expect(subject.forks_count).to eq(attributes[:forks_count])
      expect(subject.description).to eq(attributes[:description])
    end
  end
end
