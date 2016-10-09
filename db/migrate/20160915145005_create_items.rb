class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :description
      t.float   :price
      t.integer :quantity
      t.text    :ingredients
      t.text    :how_to_use
      t.boolean :presence

      t.timestamps null: false
    end
    add_index :items, :name
    add_index :items, :price
  end
end
