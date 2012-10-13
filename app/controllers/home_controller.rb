class HomeController < ApplicationController
  before_filter :require_authentication

  def show
    devices = Device.find(:all)
    logger.info(devices.inspect)
    @page = PageModels::Home::Show.new(devices)
  end
end
