class Product < ActiveRecord::Base
  belongs_to :current_status, polymorphic: true
  has_one :warehouse, through: :inventory
end
