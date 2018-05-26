require 'rails_helper'

describe "as a user" do
  it "can see follower information" do
    VCR.use_cassette("services/get_user_info") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stub_omniauth)

      visit "/dashboard"

      within(".following", match: :first) do
        expect(page).to have_content("Name: Sal Espinosa")
        expect(page).to have_content("Bio: Web Dev in Denver, CO")
        expect(page).to have_content("Company: ")
        expect(page).to have_content("Location: United States")
      end
    end
  end
end
