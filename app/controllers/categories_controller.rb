class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_authorized_user

  def create
    category = Category.create(params[:category])
    redirect_to '/categories', :statue => 303
  end

  def destroy
    if params[:confirm] == 'y'
      category = Category.find(params[:id])
      category.destroy if category
      redirect_to '/categories', :status => 303
    elsif params[:confirm] == 'n'
      redirect_to '/categories', :status => 303
    else
      @page = PageModels::Common::ConfirmDelete.new("/categories/#{params[:id]}")
      render 'common/confirm_delete'
    end
  end

  def index
    @page = PageModels::Categories::Index.new
  end

  def new
    @page = PageModels::Categories::New.new
  end
end
