require 'rails_helper'

describe GithubUser do
  before(:each) do
    VCR.use_cassette("services/get_user_info") do
      user = User.create({uid: 14942680, token: ENV["GITHUB_TOKEN"]})
      @gh_user = GithubUser.new(user)
    end
  end
  describe ".class methods" do
    it "gather information" do
      VCR.use_cassette("services/get_user_info") do

      results = @gh_user.gather_information
      expect(results[:name]).to eq("Ilana Corson")
    end
    end
  end
  describe "#instance methods" do
    it "followers" do
      VCR.use_cassette("services/get_user_info") do

      results = @gh_user.followers

      expect(results.first.class).to eq(Follower)
      expect(results.first.name).to eq("Henrique Carvalho da Cruz")
      expect(results.first.location).to eq("Sao Paulo, Brazil")
      expect(results.first.bio).to eq("Software Developer at @NetloloIncubadora")
      expect(results.first.company).to eq("@NetloloIncubadora")
    end
    end
    it "followers" do
      VCR.use_cassette("services/get_user_info") do

      results = @gh_user.following

      expect(results.first.class).to eq(Follower)
      expect(results.first.name).to eq("Sal Espinosa")
      expect(results.first.location).to eq("United States")
      expect(results.first.bio).to eq("Web Dev in Denver, CO")
      expect(results.first.company).to eq("No company provided")
    end
    end
    it "all repos" do
      VCR.use_cassette("services/get_user_info") do

      results = @gh_user.all_repos

      expect(results.first.class).to eq(Repository)
      expect(results.first.name).to eq("sass_workshop")
      expect(results.first.forks).to eq(4)
      expect(results.first.stargazers).to eq(2)
      expect(results.first.is_fork?).to eq(false)
      expect(results.first.description).to eq("No description provided")
      expect(results.first.updated_at).to eq("May 25, 2018")
    end
  end

    it "starred repos" do
      VCR.use_cassette("services/get_user_info") do

      results = @gh_user.starred_repos

      expect(results.first.class).to eq(Repository)
      expect(results.first.name).to eq("hiptique")
      expect(results.first.forks).to eq(0)
      expect(results.first.is_fork?).to eq(false)
      expect(results.first.stargazers).to eq(1)
      expect(results.first.description).to eq("No description provided")
      expect(results.first.updated_at).to eq("Jun 7, 2016")
    end
    end
  end
end
