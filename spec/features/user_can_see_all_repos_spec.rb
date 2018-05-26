require 'rails_helper'

describe "as a user" do
  it "can see all repo information" do
    VCR.use_cassette("services/get_user_info") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stub_omniauth)

      visit "/dashboard"

      expect(page).to have_content("Showing 100 Repos:")

      within(".all-repos", match: :second) do
        expect(page).to have_content("Repo: building_internal_apis")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Forked?: false")
        expect(page).to have_content("Stargazers: 0")
        expect(page).to have_content("Fork Count: 0")
        expect(page).to have_content("Primary Language: Ruby")
        expect(page).to have_content("Updated on May 1")
      end
    end
  end
end
