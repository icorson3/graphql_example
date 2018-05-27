require 'rails_helper'

describe "as a user" do
  it "I can log in through github" do
    VCR.use_cassette("services/get_user_info") do
      stub_omniauth
      visit "/"

      expect(page).to have_content("Log In through Github")

      click_on "Log In through Github"

      expect(page).to have_content("Username: icorson3")
      expect(page).to have_content("Name: Ilana Corson")
      expect(page).to have_content("Website:")
      expect(page).to have_link("turing.io")
      expect(page).to have_content("Location: Denver, CO")
      expect(page).to have_content("Bio: Associate Instructor at Turing School")
      expect(page).to have_content("Company: @turingschool")
    end
  end
end
