class WikiPagesController < ApplicationController
  def show
    device = Device.find(:asset_code => params[:id])
    if(device.reference_url)
      redirect_to device.reference.url
    else
      render :text => 'Not found', :status => 404
    end
  end
end
