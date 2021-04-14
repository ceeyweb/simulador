module Admin
  class AdminController < ActionController::Base
    layout "admin"

    protected

    def authenticate_admin!
      unless session[:current_admin]
        flash[:alert] = "Debes iniciar sesión para ingresar."

        redirect_to admin_sign_in_path
      end
    end
  end
end
