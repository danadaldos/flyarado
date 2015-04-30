class FavoriteStation < ActiveRecord::Base
  belongs_to :station
  belongs_to :user

  attr_reader :favorites

  def get_favorites
    @favorites = FavoriteStation.where(user_id = current_user)
  end

  def favorite?(user)
  end

end
