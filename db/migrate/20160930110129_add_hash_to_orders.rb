class AddHashToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :price, :float
    remove_column :orders, :quantity, :integer
    add_column :orders, :price, :float, :default => 0
    add_column :orders, :quantity, :hstore, default: {}, null: false
  end
end
