require 'rails_helper'

describe "as a user" do
  it "can see all repo information" do
    VCR.use_cassette("services/get_user_info") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stub_omniauth)

      visit "/dashboard"

      expect(page).to have_content("Showing 29 Repos:")

      within(".all-repos", match: :first) do
        expect(page).to have_content("Repo: sass_workshop")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Forked?: false")
        expect(page).to have_content("Stargazers: 2")
        expect(page).to have_content("Fork Count: 4")
        expect(page).to have_content("Primary Language: Ruby")
        expect(page).to have_content("Updated on May 25, 2018")
      end
    end
  end
end
