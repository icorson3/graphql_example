require 'rails_helper'

describe Follower do
  it "has attributes" do
    data =     {node:
                { name: "Ilana",
                  location: "denver",
                  bio: "fun",
                  company: "turing22",
                  login: "icorson3"
                  }}
    follower = Follower.new(data)

    expect(follower.name).to eq("Ilana")
    expect(follower.location).to eq("denver")
    expect(follower.bio).to eq("fun")
    expect(follower.company).to eq("turing22")
    expect(follower.login).to eq("icorson3")
  end

  it "can have blank attributes" do
    data =     {node:
                { name: "",
                  location: "",
                  bio: "",
                  company: "",
                  login: "icorson3"
                  }}
    follower = Follower.new(data)

    expect(follower.bio).to eq("No information provided")
    expect(follower.location).to eq("No information provided")
    expect(follower.name).to eq("No information provided")
    expect(follower.company).to eq("No information provided")

    data =     {node:
                { name: nil,
                  location: nil,
                  bio: nil,
                  company: nil,
                  login: "icorson3"
                  }}
    follower = Follower.new(data)

    expect(follower.bio).to eq("No information provided")
    expect(follower.name).to eq("No information provided")
    expect(follower.location).to eq("No information provided")
    expect(follower.company).to eq("No information provided")
  end
end
