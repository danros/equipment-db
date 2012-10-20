class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @page = PageModels::Users::Index.new
  end

  def update
    user = User.find(params[:id])
    user.authorized = (params[:user][:authorized] == 'true')
    redirect_to "/users", :status => 303
  end
end
