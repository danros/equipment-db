class DevicesController < ApplicationController
  def show
    device = Device.find(params[:id])
    @page = PageModels::Devices::Show.new(device)
  end
end
