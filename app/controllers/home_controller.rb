class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    devices = Device.find(:all, :order => 'name')
    @page = PageModels::Home::Show.new(devices)
  end
end
