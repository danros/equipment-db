class DevicesController < ApplicationController
  before_filter :require_authentication

  def create
    device = Device.create(params[:device])
    if device.valid?
      redirect_to device_path(device), :status => 303
    end
  end

  def edit
    raise "Not yet implemented"
  end 

  def new
  end

  def show
    device = Device.find(params[:id])
    @page = PageModels::Devices::Show.new(device)
  end

  def update
    raise "Not yet implemented"
  end
end
