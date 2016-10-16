class Shipment < ActiveRecord::Base
  belongs_to :warehouse
  has_many :products, as: :current_status

  def add(order_id)
    # go through the order
    # for each size that has a qty
    # Find the first n of that size
    # update the shipment_id 
    # remove the inventory_id
    # see if you can get shipment.products as a list of products
    # if you can't, we will have to create a list attribute that contains all of the order products

    this_order = Order.find(order_id)
    order_qty = this_order.attributes
    order_qty.each do |k,v|
      if k != 'id' && (v.is_a? Integer) && v > 0 
        warehouse.inventory.products.where(size: k).limit(v).each do |product|
          product.update_attribute(:current_status, self)
        end
      end
    end
  end

end
