require 'rails_helper'

describe User do
  it "is valid" do
    auth_info = {
                "uid"=>"14942680",
                "info"=>
                  {"nickname"=>"icorson3",
                    "name"=>"Ilana Corson"},
                "credentials"=>
                  {"token"=>"49494baba9c1be11934c9d30edbb176bf6227269"}
                }
    user = User.from_omniauth(auth_info)
    expect(user).to be_valid
  end
end
