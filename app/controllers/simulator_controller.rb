class SimulatorController < ApplicationController

  def start
    return redirect_to :question_start if is_new_user?

    @user = HealthUser.new(ProgressUser.new(user))
  end

  def part_2
    return redirect_to :question_start if is_new_user?

    @user = EducationUser.new(ProgressUser.new(user))
  end

  def part_3
    return redirect_to :question_start if is_new_user?

    @user = WorkUser.new(ProgressUser.new(user))

    return redirect_to :question_part_2 unless @user.filled_out_all_parts?
    render :user_is_employed if @user.is_employed?
  end

  def finish
    @user = SummaryUser.new(user)

    render json: {
      html: render_to_string(partial: "finish", locals: { user: @user }),
    }
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
