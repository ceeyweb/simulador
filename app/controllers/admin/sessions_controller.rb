module Admin
  class SessionsController < AdminController
    def new
      if session[:current_admin]
        redirect_to admin_root_path
      else
        @admin_login = AdminLogin.new
      end
    end

    def create
      @admin_login = AdminLogin.new(admin_login_params)

      if @admin_login.valid?
        session[:current_admin] = true

        redirect_to admin_root_path
      else
        @admin_login.password = nil
        flash.now[:alert] = "Combinación usuario/contraseña inválida."

        render :new
      end
    end

    def destroy
      reset_session

      redirect_to admin_sign_in_path
    end

    private

    def admin_login_params
      params.require(:admin_login).permit(:username, :password)
    end
  end
end
