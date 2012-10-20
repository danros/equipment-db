class OwnersController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:device_id]
      device = Device.find(params[:device_id])
      owner = Owner.find(params[:owner][:id])
      device.owners << owner
      redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
    else
      nil
    end
  end

  def destroy
    if params[:device_id]
      device = Device.find(params[:device_id])
      owner = Owner.find(params[:id])
      device.owners.delete(owner)
      redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
    else
      nil
    end
  end

  def index
    # This is only accessible in the root context
  end

  def new
    if params[:device_id]
      @page = PageModels::Owners::ForDevice::New.new(params[:device_id])
      render :template => 'owners/for_device/new'
    else
      @page = PageModels::Owners::Global::New.new
      render :template => 'owners/global/new'
    end
  end
end
