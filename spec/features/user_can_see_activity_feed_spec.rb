require 'rails_helper'

describe "as a user" do
  it "can see pinned repo information" do
    VCR.use_cassette("services/get_user_info") do
      user = User.create(uid: 1234, username: "icorson3", token: ENV["GITHUB_TOKEN"])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      within(".activity-feed", match: :first) do
        expect(page).to have_content("Created a WatchEvent Event on May 24, 2018 in icorson3/sass_workshop")
      end
    end
  end
end
