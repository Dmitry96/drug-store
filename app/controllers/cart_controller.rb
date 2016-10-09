class CartController < ApplicationController
  
  def edit
    if !(current_user)
      redirect_to new_user_registration_url
    elsif current_user.cart.positions.count > 0
      @cart = current_user.cart
      @positions = @cart.positions
      @price = @cart.price
      @position = @positions.first
      @item = Item.find(@position.item_id)
    else
    end
    @search = Item.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
  end


  def update
    @cart = current_user.cart
    @position = Position.find(params[:id])
    @cart.update(cart_params)
    @position.update(position_params)
    redirect_to @cart
  end

  def make_an_order
    @positions = current_user.cart.positions
    @cart = current_user.cart
    @cart.price = @cart.final_price(@positions)
    @cart.save
    redirect_to new_order_path
  end

  def destroy
    current_user.cart.positions.each do |p|
      p.destroy
    end
    redirect_to edit_cart_path(current_user.cart)
  end

  private 

    def cart_params
      params.require(:comment).permit(:price, :quantity)
    end

    def position_params
      params.require(:position).permit(:price, :quantity)
    end

end 
