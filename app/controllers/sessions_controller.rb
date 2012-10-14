class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:password] == 'mak3spac3'
      session[:user_id] = 1
      redirect_to root_url, :status => 303
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      redirect_to root_url
    end
  end
end
