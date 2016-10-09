class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :slug,        :string
    add_column :items, :catalog_id,  :integer
    add_column :items, :category_id, :integer
  end
end
