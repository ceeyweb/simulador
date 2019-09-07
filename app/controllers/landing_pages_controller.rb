class LandingPagesController < ApplicationController

  def home
    redirect_to where_user_left_off unless is_new_user?
  end

end
