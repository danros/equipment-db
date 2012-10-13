class HomeController < ApplicationController
  before_filter :require_authentication

  def show
    devices = Device.find(:all)
    @page = PageModels::Home::Show.new(devices)
  end
end
