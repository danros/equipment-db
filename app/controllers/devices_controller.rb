class DevicesController < ApplicationController
  before_filter :require_authentication

  def show
    device = Device.find(params[:id])
    @page = PageModels::Devices::Show.new(device)
  end
end
