class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_initialize do |u|
      u.provider = auth.provider
      u.uid = auth.uid
    end

    user.avatar_url = auth.info.image
    user.provider = auth.provider
    user.uid = auth.uid
    user.save
    user
  end
end
