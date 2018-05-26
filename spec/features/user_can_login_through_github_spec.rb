require 'rails_helper'

describe "as a user" do
  it "I can log in through github" do
    VCR.use_cassette("services/get_user_info") do
      stub_omniauth
      visit "/"

      expect(page).to have_content("Log In through Github")

      click_on "Log In through Github"

      expect(page).to have_content("icorson3")
    end
  end
end
