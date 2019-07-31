class QuestionsController < ApplicationController

  def start
    @user = User.new
  end

  def part_2
    @user = User.find(cookies["user_id"])
  end

  def part_3
    @user = User.find(cookies["user_id"])
  end

end
