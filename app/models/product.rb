
class Product < ActiveRecord::Base
	extend FriendlyId
    friendly_id :name, use: :slugged

  belongs_to :category
  validates_presence_of :name, :image, :description, :price, :category
  mount_uploader :image, ImageUploader
  include Authority::Abilities
  self.authorizer_name = 'ProductAuthorizer'
end
