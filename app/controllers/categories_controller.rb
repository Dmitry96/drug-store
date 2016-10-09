class CategoriesController < ApplicationController

  def show
    @catalog  = Catalog.friendly.find(params[:catalog_id])
    @category = @catalog.categories.friendly.find(params[:id])
    @search = @category.items.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
  end

end
