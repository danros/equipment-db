class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_authorized_user
    render :text => 'Not authorized', :status => 401 unless current_user.authorized?
  end
end
