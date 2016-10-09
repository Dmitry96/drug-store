class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :quantity,     :integer
    add_column :orders, :email,        :string
    add_column :orders, :name,         :string
    add_column :orders, :phone_number, :string
    add_column :orders, :card_token,   :string
    add_column :orders, :city,         :string
  end
end
