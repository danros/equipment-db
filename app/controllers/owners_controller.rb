class OwnersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def create
    if params[:device_id]
      device = Device.find(params[:device_id])
      owner = Owner.find(params[:owner][:id])
      device.owners << owner
      redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
    else
      owner = Owner.create(params[:owner])
      if owner.valid?
        redirect_to '/owners', :status => 303
      end
    end
  end

  def destroy
    if params[:device_id]
      if params[:confirm] == 'y'
        device = Device.find(params[:device_id])
        owner = Owner.find(params[:id])
        device.owners.delete(owner)
        redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
      elsif params[:confirm] == 'n'
        redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
      else
        @page = PageModels::Common::ConfirmDelete.new("/devices/#{params[:device_id]}/owners/#{params[:id]}")
        render 'common/confirm_delete'
      end
    else
      if params[:confirm] == 'y'
        owner = Owner.find(params[:id])
        owner.destroy if owner
        redirect_to '/owners', :status => 303
      elsif params[:confirm] == 'n'
        redirect_to '/owners', :status => 303
      else
        @page = PageModels::Common::ConfirmDelete.new("/owners/#{params[:id]}")
        render 'common/confirm_delete'
      end
    end
  end

  def index
    # This is only accessible in the root context
    @page = PageModels::Owners::Global::Index.new
    render :template => 'owners/global/index'
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
