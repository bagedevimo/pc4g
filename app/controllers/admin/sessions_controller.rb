# frozen_string_literal: true

class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_admin!, only: %i[new create]

  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.find_by(email: admin_params[:email])

    if admin&.authenticate(admin_params[:password])
      admin_session = admin.sessions.create!
      session[:current_admin_session_id] = admin_session.id
      redirect_to admin_root_path
      return
    else
      @admin = Admin.new(email: admin_params[:email])

      flash[:error] = if admin.blank?
        I18n.t("admin.sessions.wrong_email")
      else
        I18n.t("admin.sessions.wrong_password")
      end
    end

    render :new, status: :unprocessable_content
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
