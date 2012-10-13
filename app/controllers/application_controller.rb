class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_authentication
    render :text => 'Forbidden!', :status => 403 unless session[:user_id]
  end
end
