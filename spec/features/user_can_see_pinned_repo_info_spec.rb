require 'rails_helper'

describe "as a user" do
  it "can see pinned repo information" do
    VCR.use_cassette("services/get_user_info") do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(stub_omniauth)

      visit "/dashboard"

      within(".popular-repos", match: :first) do
        expect(page).to have_content("Name: sass_workshop")
        expect(page).to have_content("Forks: 4")
        expect(page).to have_content("Stargazers: 2")
        expect(page).to have_content("Most used language: Ruby")
      end
    end
  end
end
