class SimulatorController < ApplicationController

  def start
    @user = HealthUser.new(user)
  end

  def part_2
    @user = HealthUser.new(EducationUser.new(user))
  end

  def part_3
    @user = HealthUser.new(user)
    render :user_is_employed if @user.is_employed?
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
