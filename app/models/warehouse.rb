class Warehouse < ActiveRecord::Base
  has_one :inventory
  has_many :products, through: :inventory, source: :current_status, source_type: 'Inventory'
  has_many :products, through: :shipments, source: :current_status, source_type: 'Shipment'
  has_many :shipments

  def receive_order(order_id)
    # check if this warehouse's inventory has everything
    # if it does,
      # create a new shipment
      # add products to shipment
      # update inventory by removing them
    # else
      # send an error or call find_warehouse

    shipment = Shipment.create(warehouse_id: self.id)
    shipment.add(order_id)
    inventory.update_inventory
  end
end
