class UsersController < ApplicationController

  def create
    @user = User.create!(user_params.merge(ip_address))
    cookies[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(
      :edad,
      :estado_residencia,
      :ultimo_grado_cursado,
      :sexo,
      :asistes_escuela,
    )
  end

  def ip_address
    { ip_address: request.remote_ip }
  end

end
