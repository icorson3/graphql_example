require 'rails_helper'

describe GithubService do
  attr_reader :service

  before(:each) do
    user = stub_omniauth
    @service = GithubService.new(user)
  end

  describe 'github service' do
    it 'makes api call to finds my profile information' do

        
    end
  end
end
