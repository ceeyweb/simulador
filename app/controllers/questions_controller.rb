class QuestionsController < ApplicationController

  def start
    return redirect_to where_user_left_off unless is_new_user?
    @user = User.new
  end

  def part_2
    return redirect_to :question_start if is_new_user?
    @user = ProgressUser.new(user)
  end

  def part_3
    return redirect_to :question_start if is_new_user?
    @user = user
  end

end
