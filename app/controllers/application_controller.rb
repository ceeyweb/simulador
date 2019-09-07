class ApplicationController < ActionController::Base

  private

  def is_new_user?
    !!cookies["user_id"]
  end

  def where_user_left_off
    ProgressUser.new(user).last_url_path
  end

  def user
    @_user ||= User.find(cookies["user_id"])
  end

end
