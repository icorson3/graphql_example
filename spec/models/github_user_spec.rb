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
    it "followers" do
      data = YAML.load_file('spec/fixtures/user_data.yml').deep_symbolize_keys
      results = GithubUser.new(data).followers

      expect(results.first.class).to eq(Follower)
      expect(results.first.name).to eq("Ilana")
      expect(results.first.location).to eq("denver")
      expect(results.first.bio).to eq("fun")
      expect(results.first.company).to eq("turing22")
    end
  end
end
