class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:username])
    user = user.authenticate(params[:session][:password]) if user

    if user
      session[:user_id] = user.id
      flash[:success] = "Sucessfully signed in as \"#{user.name}\" <#{user.email}>."
      redirect_to root_url, :status => 303
    end

    flash.now[:error] = 'You entered an incorrect username or password'
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)

      flash[:info] = 'You have been signed out.'
      redirect_to root_url
    end
  end
end
