class Product < ActiveRecord::Base
  belongs_to :current_status
  has_one :warehouse, through: :inventory
  belongs_to :shipment
end
