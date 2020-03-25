class QuestionsController < ApplicationController

  def start
    # return redirect_to where_user_left_off unless is_new_user?
    redirect_to root_path if params[:age].blank?

    @user = User.new(age: params[:age])
  end

  def part_2
    # return redirect_to :question_start if is_new_user?

    @user = ProgressUser.new(user)

    # redirect_to :question_part_3 if @user.part_2_is_complete?
  end

  def part_3
    # return redirect_to :question_start if is_new_user?

    @user = ProgressUser.new(user)

    # redirect_to :simulator_start if @user.filled_out_all_parts?
  end

end
