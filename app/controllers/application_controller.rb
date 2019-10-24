class ApplicationController < ActionController::Base

  before_action :set_locale

  private

  def is_new_user?
    !cookies["user_id"]
  end

  def where_user_left_off
    ProgressUser.new(user).last_url_path
  end

  def user
    @_user ||= User.find(cookies["user_id"])
  end

  def set_locale
    I18n.locale = :es
  end

end
