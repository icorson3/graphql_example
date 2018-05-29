require 'rails_helper'

describe Follower do
  before(:each) do
    data =     {node:
                { name: "Ilana",
                  login: "icorson3",
                  location: "denver",
                  bio: "fun",
                  company: "turing22" }}
    data_2 =     {node:
                { name: "",
                  login: "icorson3",
                  location: "denver",
                  bio: "fun",
                  company: "turing22" }}
    @follower = Follower.new(data)
    @follower_2 = Follower.new(data_2)
  end
  it "has attributes" do


    expect(@follower.name).to eq("Ilana")
    expect(@follower.login).to eq("icorson3")
    expect(@follower.location).to eq("denver")
    expect(@follower.bio).to eq("fun")
    expect(@follower.company).to eq("turing22")
  end

  it "returns no name provided" do
    expect(@follower_2.name).to eq("No name provided")
  end

end
