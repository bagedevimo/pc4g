class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  attr_reader :current_admin

  helper_method :current_admin

  private

  def authenticate_admin!
    if admin_session = AdminSession.find_by(id: session[:current_admin_session_id])
      @current_admin_session = admin_session
      @current_admin = admin_session.admin
    else
      session.delete(:admin_session_id)
      redirect_to new_admin_session_path
    end
  end
end
