require 'rails_helper'

describe Repository do
  before(:each) do
    raw_data = {:node=>
      {:name=>"sass_workshop",
        :forkCount=>3,
        :isFork=> false,
        :description=>"heyyo",
        :updatedAt=> "2017-01-04T18:56:28Z",
        :stargazers=>
          {:edges=>
            [{:node=>{:login=>"andersklenke"}}]},
            :languages=>
              {:edges=>
                [{:node=>{:name=>"Ruby"}}]}}}
    @repo = Repository.new(raw_data)
  end


  it "has a name" do
    expect(@repo.name).to eq("sass_workshop")
    expect(@repo.forks).to eq(3)
    expect(@repo.stargazers).to eq(1)
    expect(@repo.language).to eq("Ruby")
    expect(@repo.is_fork?).to eq(false)
    expect(@repo.updated_at).to eq("Jan 4, 2017")
  end

  it "can count stargazers" do
    data = {:stargazers=>
            {:edges=>
              [{:node=>{:login=>"andersklenke"}}]}}
    expect(@repo.count_stargazers(data)).to eq(1)
  end
end
