require 'rails_helper'

describe "as a user" do
  it "I can log in through github" do
    visit "/"

    expect(page).to have_content("Log In through Github")
  end
end
