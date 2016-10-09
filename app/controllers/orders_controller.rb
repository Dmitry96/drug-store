class OrdersController < ApplicationController
after_action :to_zero, only:[:create]

  def new
    @order = Order.new
    @cart  = current_user.cart.id
    @search = Item.search(params[:q])
    @items  = @search.result(:distinct => true).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @order = Order.new order_params.merge(email: stripe_params["stripeEmail"],
                                          card_token: stripe_params["stripeToken"])
    raise "Please, check order errors" unless @order.valid?
    @order.process_payment
    @order.save
    redirect_to root_url
  end


  private

    def order_params
      params.require(:order).permit(:user_id, :quantity, :email, :name, :phone_number,
       :city, :date, :price, :cart_id, :stripe_token)
    end    

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def to_zero
      @cart = current_user.cart
      @cart.price = 0.0
      @cart.quantity = {}
      @cart.items.delete_all
      @cart.save
    end

end
