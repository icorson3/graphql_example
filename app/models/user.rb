class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    find_or_create_by(uid: auth_info[:uid]) do |user|
      user.username = auth_info["info"]["nickname"]
      user.uid = auth_info["uid"]
      user.token = auth_info["credentials"]["token"]
      user.save
    end
  end
end
