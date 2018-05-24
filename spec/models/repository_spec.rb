require 'rails_helper'

describe Repository do
  it "has a name" do
    raw_data = { node: {id: 123, name: "repo1"} }
    repo = Repository.new(raw_data)

    expect(repo.name).to eq("repo1")
  end
end
