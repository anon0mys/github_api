class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid = auth_info.uid
      user.name = auth_info.extra.raw_info.name
      user.username = auth_info.extra.raw_info.login
      user.oauth_token = auth_info.credentials.token
      user.avatar = auth_info.extra.raw_info.avatar_url
    end
  end
end
