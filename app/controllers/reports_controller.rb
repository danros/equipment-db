class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def show
    devices = Device.find(:all, :conditions => 'minor_item != 1')
    @page = PageModels::Reports::Show.new(devices)
  end
end