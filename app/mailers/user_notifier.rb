class UserNotifier < ApplicationMailer
  helper :application
  default from: 'Flyarado - <DoNotReply@davinci-fly-fishing.herokuapp.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.signed_up.subject
  #

  def favorite_updates(user)
    @user = user
    @stations = @user.stations#.where(nil)
    mail to: @user.email
  end

  def signed_up(user)
    @user = user
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verified.subject
  #
  def verified(user)
    @user = user
    mail to: @user.email

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verify.subject
  #
  def verify(user)
    @user = user
    mail to: @user.email
  end

  def current_user
    @user
  end
end
