class AddPriceToCart < ActiveRecord::Migration
  def change
    remove_column(:carts, :price, :float)
    remove_column(:carts, :quantity, :integer)
    add_column :carts, :price, :float, :default => 0
    add_column :carts, :quantity, :hstore, default: {}, null: false
  end
end
