class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :date, :date
  end
end
