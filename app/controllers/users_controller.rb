class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

# FIXME: for later
#  def destroy
#    @user = User.find(params[:id])
#    @user.destroy
#
#    redirect_to root_path
#  end
end
