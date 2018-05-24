require 'rails_helper'

describe ProfileInformation do
  it "returns repos" do
    expect(ProfileInformation.new.repos).to eq([Repository, Repository, Repository])
  end
end
