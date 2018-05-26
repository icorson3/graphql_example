require 'rails_helper'

describe Follower do
  it "has attributes" do
    data =     {node:
                { name: "Ilana",
                  location: "denver",
                  bio: "fun",
                  company: "turing22" }}
    follower = Follower.new(data)

    expect(follower.name).to eq("Ilana")
    expect(follower.location).to eq("denver")
    expect(follower.bio).to eq("fun")
    expect(follower.company).to eq("turing22")
  end
end
