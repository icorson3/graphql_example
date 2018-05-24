require 'rails_helper'

describe "as a user" do
  it "I can log in through github" do
    stub_omniauth
    visit "/"

    expect(page).to have_content("Log In through Github")

    click_on "Log In through Github"

    expect(page).to have_content("icorson3")
    expect(page).to have_content("Ilana Corson")
    expect(page).to have_content("Denver, CO")

  #   within(".popular-repos", match: :first) do
  #     expect(page).to have_content("sass_workshop")
  #   end
  #
  #   within(".contributions") do
  #     expect(page).to have_content("586 contributions in the last year")
  #   end
  #
  #   within(".contribution-activity") do
  #     expect(page).to have_content("Created 16 commits in 5 repositories")
  #   end
  end
end
