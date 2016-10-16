class Inventory < ActiveRecord::Base
  belongs_to :warehouse
  has_many :products

  def update_inventory
    #find a way to automatically do this w/o you having to call the method
    update_attributes(
      twin: self.products.where(size: "twin").count, 
      twinXL: self.products.where(size: "twinXL").count, 
      full: self.products.where(size: "full").count, 
      queen: self.products.where(size: "queen").count, 
      king: self.products.where(size: "king").count, 
      calking: self.products.where(size: "calking").count
    )
  end
end
