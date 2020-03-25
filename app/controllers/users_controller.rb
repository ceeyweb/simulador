class UsersController < ApplicationController

  def create
    @user = User.new(user_params.merge(ip_address))
    if @user.valid?
      create_user_and_redirect
    else
      unless @user.father_is_alive?
        @user.father_residency_id = nil
        @user.father_education_grade_id = nil
      end

      unless @user.mother_is_alive?
        @user.mother_residency_id = nil
        @user.mother_education_grade_id = nil
      end

      render question_start_path
    end
  end

  def create_user_and_redirect
    @user.save!
    cookies[:user_id] = @user.id
    redirect_to question_part_2_path
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to URI.parse(params[:next_step]).path
  end

  private

  def user_params
    params.
      require(:user).
      reject! { |key| ["id", "ip_address"].include? key }.
      permit!
  end

  def ip_address
    { ip_address: request.remote_ip }
  end

end
