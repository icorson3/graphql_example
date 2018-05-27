require 'rails_helper'

describe "as a user" do
  it "can see following information" do
    VCR.use_cassette("services/get_user_info") do
      user = User.create(uid: 1234, username: "icorson3", token: ENV["GITHUB_TOKEN"])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      expect(page).to have_content("Total Following: 7")

      within(".following", match: :first) do
        expect(page).to have_content("Name: Sal Espinosa")
        expect(page).to have_content("Bio: Web Dev in Denver, CO")
        expect(page).to have_content("Company: ")
        expect(page).to have_content("Location: United States")
      end
    end
  end
end
