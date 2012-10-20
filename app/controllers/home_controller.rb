class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def show
    devices = Device.find(:all, :order => 'name')
    @page = PageModels::Home::Show.new(devices)
  end
end
