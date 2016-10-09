class PositionsController < ApplicationController

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    @cart = current_user.cart
    @position.calc_price
    @position.update(position_params)
    
    @positions = current_user.cart.positions
    current_user.cart.price = current_user.cart.final_price(@positions)    
    current_user.cart.save
    redirect_to edit_cart_path(current_user.cart)
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to edit_cart_path(current_user.cart)
  end

  def position_params
    params.require(:position).permit(:price, :quantity)
  end

end 