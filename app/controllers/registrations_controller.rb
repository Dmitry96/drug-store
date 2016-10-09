class RegistrationsController < Devise::RegistrationsController
after_action :cart_add, only:[:create]

  def new
    @search = Item.search(params[:q])
    @items = @search.result.paginate(:page => params[:page], :per_page => 10)   

    super
  end

  def create
    @search = Item.search(params[:q])
    @items = @search.result.paginate(:page => params[:page], :per_page => 10)       

    super
  end

  def update
    super
  end

  private

  def cart_add
    if current_user && current_user.cart.nil?
      @cart = Cart.create
      @cart.user_id = current_user.id
      @cart.save
    end
  end  
end
