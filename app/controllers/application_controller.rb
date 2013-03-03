class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_authorized_user
    render :template => 'sessions/unauthorized', :status => 401 unless current_user.authorized?
  end
end
