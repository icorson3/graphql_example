require 'rails_helper'

describe ProfileInformation do
  it "returns repos" do
    user = stub_omniauth
    expect(ProfileInformation.new(user).repos).to eq([Repository, Repository, Repository])
  end
end
