require 'rails_helper'

describe "as a user" do
  it "can see follower information" do
    VCR.use_cassette("services/get_user_info") do
      user = User.create(uid: 1234, username: "icorson3", token: ENV["GITHUB_TOKEN"])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      expect(page).to have_content("Total Followers: 10")

      within(".followers", match: :first) do
        expect(page).to have_content("Name: Henrique Carvalho da Cruz")
        expect(page).to have_content("Bio: Software Developer at @NetloloIncubadora")
        expect(page).to have_content("Company: @NetloloIncubadora")
        expect(page).to have_content("Location: Sao Paulo, Brazil")
      end
    end
  end
end
