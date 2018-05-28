require 'rails_helper'

describe "as a user" do
  it "can see pinned repo information" do
    VCR.use_cassette("services/get_user_info") do
      user = User.create(uid: 1234, username: "icorson3", token: ENV["GITHUB_TOKEN"])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      within(".activity-feed", match: :first) do
        expect(page).to have_content("Created 16 commits in 5 repositories.")
      end
    end
  end
end
