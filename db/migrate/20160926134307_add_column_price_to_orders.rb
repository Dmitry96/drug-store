class AddColumnPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price, :float
  end
end
