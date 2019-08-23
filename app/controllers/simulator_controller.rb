class SimulatorController < ApplicationController

  def start
    @user = HealthUser.new(user)
  end

  def part_2
  end

  def part_3
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
