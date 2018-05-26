require 'rails_helper'

describe "as a user" do
  it "I can log in through github" do
    VCR.use_cassette("services/get_user_info") do
      stub_omniauth
      visit "/"

      expect(page).to have_content("Log In through Github")

      click_on "Log In through Github"

      expect(page).to have_content("icorson3")

      within(".popular-repos", match: :first) do
        expect(page).to have_content("Name: sass_workshop")
        expect(page).to have_content("Forks: 3")
        expect(page).to have_content("Stargazers: 1")
        expect(page).to have_content("Most used language: Ruby")
      end

      # within(".followers", match: :first) do
      #   expect(page).
      # end

    #   within(".contributions") do
    #     expect(page).to have_content("586 contributions in the last year")
    #   end
    #
    #   within(".contribution-activity") do
    #     expect(page).to have_content("Created 16 commits in 5 repositories")
    #   end
    end
  end
end
