require 'rails_helper'

describe GithubUser do
  describe ".class methods" do
    it "gather information" do
      VCR.use_cassette("services/get_user_info") do
        user = stub_omniauth
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
  end
end
