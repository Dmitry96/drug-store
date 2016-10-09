class AddImageColumnsToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :image
    end
  end
end
