class CatalogsController < ApplicationController

  def show
    @catalog  = Catalog.friendly.find(params[:id])
    @items    = @catalog.items.all
    @search = @items.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
  end

end
