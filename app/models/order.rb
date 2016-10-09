class Order < ActiveRecord::Base

  belongs_to :user
  has_many   :items
  belongs_to :cart

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: (cart.price * 100).to_i,
                          description: cart.id,
                          currency: 'usd'

  end
end
