class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def create
    device = Device.find(params[:device_id])
    device.tickets.create(params[:ticket])
    redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
  end

  def new
    @page = PageModels::Tickets::New.new(params[:device_id], current_user.id)
  end

  def update
    ticket = Ticket.find(params[:id])
    ticket.update_attributes(params[:ticket])
    redirect_to "/devices/#{params[:device_id]}", :status => 303 # TODO: Should this be part of the page model?
  end
end
