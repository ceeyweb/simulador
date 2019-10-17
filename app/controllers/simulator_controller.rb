class SimulatorController < ApplicationController

  def start
    @user = HealthUser.new(user)
  end

  def part_2
    @user = HealthUser.new(EducationUser.new(user))
  end

  def part_3

    def delete(name, options = {})
    options.stringify_keys!
    set_cookie(options.merge("name" => name.to_s, "value" => "", "expires" => Time.at(0)))
    end
    
    @user = HealthUser.new(WorkUser.new(user))
    render :user_is_employed if @user.is_employed?
  end

  private

  def user
    User.find(cookies["user_id"])
  end

end
