class Category < ActiveRecord::Base

  include FriendlyId
  friendly_id :slug

  belongs_to :catalog
  has_many   :items

  
end
