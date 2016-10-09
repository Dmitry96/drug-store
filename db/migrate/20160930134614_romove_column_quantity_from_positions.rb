class RomoveColumnQuantityFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :quantity, :integer
    add_column    :positions, :quantity, :integer, default: 1
  end
end
