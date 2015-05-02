class User < ActiveRecord::Base
  has_many :favorite_stations
  has_many :stations, through: :favorite_stations
  has_secure_password
  validates_presence_of :first_name, :last_name, :email

  def needs_verification!
    self.update_attributes!(
      token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver_now
  end

  def update_email
    UserNotifier.favorite_updates(self).deliver_now
  end

end
