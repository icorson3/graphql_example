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

      expect(results).to eq([Follower, Follower, Follower])
    end
  end
end
