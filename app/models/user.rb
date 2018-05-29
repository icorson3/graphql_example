class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |user|
      user.username = auth_info["info"]["nickname"]
      user.uid = auth_info["uid"]
      user.token = auth_info["credentials"]["token"]
      user.save
    end
    user.update(token: auth_info["credentials"]["token"])
    user
  end
end
