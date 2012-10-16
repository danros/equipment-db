class DevicesController < ApplicationController
  before_filter :authenticate_user!

  def create
    device = Device.create(params[:device])
    if device.valid?
      redirect_to device_path(device), :status => 303
    end
    # @page = PageModels::Device::Create.new
  end

  def edit
    device = Device.find(params[:id])
    @page = PageModels::Devices::Edit.new(device)
  end

  def new
    @page = PageModels::Devices::New.new
  end

  def show
    device = Device.find(params[:id])
    @page = PageModels::Devices::Show.new(device)
  end

  def update
    device = Device.find(params[:id])
    device.update_attributes(params[:device])
    device.save
    if device.valid?
      redirect_to device_path(device), :status => 303
    end
  end
end
