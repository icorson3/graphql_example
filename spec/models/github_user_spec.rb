require 'rails_helper'

describe GithubUser do

  it ".class methods" do
    VCR.use_cassette("services/get_user_info") do
      user = stub_omniauth
      results = GithubUser.gather_information(user)
      expect(results.data[:name]).to eq("Ilana Corson")
    end
  end
end
