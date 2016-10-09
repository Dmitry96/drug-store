class Position < ActiveRecord::Base

  belongs_to :item
  belongs_to :cart

  def calc_price
    self.price = Item.find(self.item_id).price * self.quantity
    save
    return self.price
  end

end
