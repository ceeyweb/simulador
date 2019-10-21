class SimulatorController < ApplicationController

  def start
    @user = HealthUser.new(ProgressUser.new(user))
  end

  def part_2
    @user = EducationUser.new(ProgressUser.new(user))
  end

  def part_3
    @user = WorkUser.new(ProgressUser.new(user))

    render :user_is_employed if @user.is_employed?
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
