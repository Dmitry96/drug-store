class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_reader :set_catalogs, :set_search, :cart_add
  before_action :set_catalogs
# before_action :set_search

private

  def set_catalogs
    @catalogs = Catalog.all
  end

  def set_search
    #@search = Item.search(params[:q])
    #@items = @search.result.paginate(:page => params[:page], :per_page => 10)
  end
  
end
