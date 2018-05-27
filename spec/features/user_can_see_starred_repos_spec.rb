require 'rails_helper'

describe "as a user" do
  it "can see starred repo information" do
    VCR.use_cassette("services/get_user_info") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stub_omniauth)

      visit "/dashboard"

      within(".starred-repos", match: :first) do
        expect(page).to have_content("Repo: hiptique")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Forked?: false")
        expect(page).to have_content("Stargazers: 1")
        expect(page).to have_content("Fork Count: 0")
        expect(page).to have_content("Primary Language: Ruby")
        expect(page).to have_content("Updated on Jun 7, 2016")
      end
    end
  end
end
