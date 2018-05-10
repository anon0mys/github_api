require 'spec_helper'
require './app/models/github_user'

describe GithubUser do
  let(:attributes) {
    {
      login: "anon0mys",
      id: 34108893,
      name: "Evan Wheeler",
      bio: 'A Bio',
      avatar_url: "https://avatars2.githubusercontent.com/u/34108893?v=4",
      public_repos: 59,
      followers: 1,
      following: 0
    }
  }
  subject { GithubUser.new(attributes) }

  context 'attributes' do
    it 'initializes with valid attributes' do
      expect(subject.login).to eq(attributes[:login])
      expect(subject.uid).to eq(attributes[:id])
      expect(subject.name).to eq(attributes[:name])
      expect(subject.bio).to eq(attributes[:bio])
      expect(subject.avatar).to eq(attributes[:avatar_url])
      expect(subject.public_repos).to eq(attributes[:public_repos])
      expect(subject.followers).to eq(attributes[:followers])
      expect(subject.following).to eq(attributes[:following])
    end
  end
end
