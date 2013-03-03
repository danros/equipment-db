class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    categories = Category.find(:all, :order => 'name')
    uncategorised_devices = Device.find(:all, :conditions => 'category_id is null or category_id = -1', :order => 'name')
    @page = PageModels::Home::Show.new(categories, uncategorised_devices)
  end
end
