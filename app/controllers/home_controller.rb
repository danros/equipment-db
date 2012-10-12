class HomeController < ApplicationController
  def show
    devices = Device.find(:all)
    @page = PageModels::Home::Show.new(devices)
  end
end
