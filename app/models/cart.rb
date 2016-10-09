class Cart < ActiveRecord::Base

  belongs_to  :user
  has_many    :positions
  has_many    :items, through: :positions

  def final_price (positions)
    sum1 = 0, sum2 = 0
    positions.each do |p|
      i = Item.find(p.item_id)
      sum1 = i.price * p.quantity
      sum2 += sum1
    end
    return sum2
  end

  def correct_quantity(items)
    h = Hash.new(0)
    array = Array.new
    items.each do |i|
      array << i.name
    end
    array.each{|e| h[e] += 1}
    self.quantity = h
    self.save
    return h
  end

end
