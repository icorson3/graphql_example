require 'rails_helper'

describe GithubUser do

  xit "#instance methods" do
    VCR.use_cassette("services/get_user_info") do
      user = stub_omniauth
      t = GithubUser.gather_information(user)
      binding.pry
    end
  end
  it ".class methods" do

  end
end
