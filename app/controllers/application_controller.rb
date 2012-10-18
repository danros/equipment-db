class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_authentication
    render :forbidden unless session[:user_id]
  end
end
