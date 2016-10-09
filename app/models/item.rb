class Item < ActiveRecord::Base
  
  include FriendlyId
  friendly_id   :slug
  
  validates :price, :catalog, :category, :name, :slug,  :presence => true

  has_attached_file :image, styles: { medium: "216x216>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image

  has_many      :positions
  has_many      :carts, through: :positions
  belongs_to    :catalog
  belongs_to    :category

  ratyrate_rateable "rating"

end
