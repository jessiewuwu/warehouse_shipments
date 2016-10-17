class Order < ActiveRecord::Base

  def new_order(order_list)
    order_list.each do |k, v|
      update_attributes(k => v)
    end
  end

  def find_warehouse
    
    list_of_possible_inventories = Inventory.where('twin >= ? AND twinXL >= ? AND full >= ? AND queen >= ? AND king >= ? AND calking >=?', self.twin, self.twinXL, self.full, self.queen, self.king, self.calking )

    if list_of_possible_inventories.any? 
      warehouse_id = list_of_possible_inventories.first.warehouse_id
      send_order(warehouse_id, self.id)
    else # what happens if the order has to be shipped between different warehouses?
      list_of_inventories = []
      order_list.each_with_index do |(k,v), index|
        str = "#{k.to_s} >= ?"
        list_of_inventories.push(Inventory.where(str, v))
      end

      # for duplicates, meaning the same warehouse has 2 of the product sizes requested from order, send 1 order there with the appropriate product-qty
      # for non-duplicates, send 1 order there with the appropriate product-qyt
    end

  end

  def send_order(warehouse_id, order_id)
    Warehouse.find(warehouse_id).receive_order(order_id)
  end
end

