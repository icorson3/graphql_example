require 'rails_helper'

describe Feed do
  it "has attributes" do
    data = { type: "CreateEvent", created_at: "2018-05-24T23:26:12Z", repo: { name: "icorson3//Hello" } }
    feed = Feed.new(data)

    expect(feed.type).to eq(data[:type])
    expect(feed.created_at).to eq("May 24, 2018")
    expect(feed.repo).to eq(data[:repo][:name])
  end
end
