class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :omniauthable,  omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    where(uuid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end
end
