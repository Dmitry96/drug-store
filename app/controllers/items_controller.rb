class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy] 

  def new
    if current_user && current_user.admin?
      @item = Item.new
    else
      redirect_to root_path
    end
    @search = Item.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)   
  end

  def create
    @search = Item.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
    
    @item = Item.new (items_params)
    if @item.save
      redirect_to items_path, :notice => "New item was created successfully."
    else
      render :action => :new
    end
  end

  def index
    if current_user && current_user.cart.nil?
      @cart = Cart.create
      @cart.user_id = current_user.id
      @cart.save
    end
    @search = Item.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def to_cart
    @item = Item.friendly.find(params[:id])
    @items = current_user.cart.items

    @position = Position.create
    @position.item_id = @item.id
    @position.cart_id = current_user.cart.id
    @position.price ||= @item.price
    @position.save

    @positions = current_user.cart.positions
    current_user.cart.price = current_user.cart.final_price(@positions)
    current_user.cart.save

    redirect_to root_path
  end

  def destroy
    @item.destroy
    #redirect_to root_path
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

private

  def set_item
    @item = Item.friendly.find(params[:id])
  end

  def set_catalogs
    @catalogs = Catalog.all
  end

  def items_params
    if current_user.admin?
      params.require(:item).permit(:name, :description, :price, :quantity, 
      :ingredients, :how_to_use, :presence, :slug, :catalog_id, :category_id, :image,
      :short_description)
    end
  end
end
