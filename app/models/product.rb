class Product < ActiveRecord::Base
  belongs_to :inventory
  has_one :warehouse, through: :inventory
  belongs_to :shipment
end
