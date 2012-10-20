class MaintainersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def create
    device = Device.find(params[:device_id])
    user = User.find(params[:user][:id])
    device.maintainers << user
    redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
  end

  def destroy
    if params[:confirm] == 'y'
      device = Device.find(params[:device_id])
      user = User.find(params[:id])
      device.maintainers.delete(user)
      redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
    elsif params[:confirm] == 'n'
      redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
    else
      @page = PageModels::Common::ConfirmDelete.new("/devices/#{params[:device_id]}/maintainers/#{params[:id]}")
      render 'common/confirm_delete'
    end
  end

  def new
    @page = PageModels::Maintainers::New.new(params[:device_id])
  end
end
