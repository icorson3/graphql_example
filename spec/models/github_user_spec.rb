require 'rails_helper'

describe GithubUser do
  describe ".class methods" do
    it "gather information" do
      VCR.use_cassette("services/get_user_info") do
        user = User.create({uid: 14942680, token: ENV["GITHUB_TOKEN"]})
        results = GithubUser.gather_information(user)
        expect(results.data[:name]).to eq("Ilana Corson")
      end
    end
  end
  describe "#instance methods" do
    before(:each) do
      @data = YAML.load_file('spec/fixtures/user_data.yml').deep_symbolize_keys
    end
    it "followers" do
      results = GithubUser.new(@data).followers

      expect(results.first.class).to eq(Follower)
      expect(results.first.name).to eq("hiya")
      expect(results.first.location).to eq("denver")
      expect(results.first.bio).to eq("fun")
      expect(results.first.company).to eq("turing22")
    end
    it "followers" do
      results = GithubUser.new(@data).following

      expect(results.first.class).to eq(Follower)
      expect(results.first.name).to eq("hiyaf")
      expect(results.first.location).to eq("denverf")
      expect(results.first.bio).to eq("funf")
      expect(results.first.company).to eq("turing22f")
    end
    it "all repos" do
      results = GithubUser.new(@data).all_repos

      expect(results.first.class).to eq(Repository)
      expect(results.first.name).to eq("sass_workshop")
      expect(results.first.forks).to eq(3)
      expect(results.first.stargazers).to eq(2)
      expect(results.first.is_fork?).to eq(false)
      expect(results.first.description).to eq("cool")
      expect(results.first.updated_at).to eq("May 24, 2018")
    end

    it "starred repos" do
      results = GithubUser.new(@data).starred_repos

      expect(results.first.class).to eq(Repository)
      expect(results.first.name).to eq("sass_workshop star")
      expect(results.first.forks).to eq(3)
      expect(results.first.is_fork?).to eq(false)
      expect(results.first.stargazers).to eq(2)
      expect(results.first.description).to eq("cool")
      expect(results.first.updated_at).to eq("May 24, 2018")
    end
  end
end
