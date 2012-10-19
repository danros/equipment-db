class OwnersController < ApplicationController
  before_filter :authenticate_user!

  def create
    device = Device.find(params[:device_id])
    owner = Owner.find(params[:owner][:id])
    device.owners << owner
    redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
  end

  def destroy
    device = Device.find(params[:device_id])
    owner = Owner.find(params[:id])
    device.owners.delete(owner)
    redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
  end

  def new
    @page = PageModels::Owners::New.new(params[:device_id])
  end
end
