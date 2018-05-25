require 'rails_helper'

describe GithubService do

  describe 'github service' do
    it 'makes api call to finds my profile information' do
      VCR.use_cassette("services/get_user_info") do
        user = stub_omniauth
        results = GithubService.gather_information(user)[:data][:viewer][:name]
        expect(results).to eq("Ilana Corson")
      end
    end
  end
end
