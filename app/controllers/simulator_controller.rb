class SimulatorController < ApplicationController

  def start
    @user = HealthUser.new(user)
  end

  def part_2
    @user = HealthUser.new(user)
  end

  def part_3
    @user = HealthUser.new(user)
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
