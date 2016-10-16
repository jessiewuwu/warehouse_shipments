class Inventory < ActiveRecord::Base
  belongs_to :warehouse
  has_many :products, as: :current_status

  def update_inventory
    #find a way to automatically do this w/o you having to call the method
    update_attributes(
      twin: products.where(size: "twin").count, 
      twinXL: products.where(size: "twinXL").count, 
      full: products.where(size: "full").count, 
      queen: products.where(size: "queen").count, 
      king: products.where(size: "king").count, 
      calking: products.where(size: "calking").count
    )
  end
end
