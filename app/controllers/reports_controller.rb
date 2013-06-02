class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def show
    report = Reports::Accounting.new
    @page = PageModels::Reports::Show.new(report.devices)
  end
end
