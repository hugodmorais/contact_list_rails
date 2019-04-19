class ApplicationController < ActionController::Base
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user_group(ids)
    @current_user_group ||= UserGroup.find(ids)
  end

  include SessionsHelper

  private

    def require_logged_in_user
      unless user_signed_in?
        flash[:danger] = 'Area restrita. Por favor, realize o login'
        redirect_to entrar_path
      end
    end

end
