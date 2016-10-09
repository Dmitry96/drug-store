class Catalog < ActiveRecord::Base
  
  include FriendlyId
  friendly_id :slug

  has_many :categories
  has_many :items

end
