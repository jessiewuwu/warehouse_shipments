class Order < ActiveRecord::Base

  def new_order(order_list)
    order_list.each do |k, v|
      update_attributes(k => v)
    end
  end

  def find_warehouse
    # what happens if the order has to be shipped between different warehouses?
    warehouse_id = Inventory.where('twin >= ? AND twinXL >= ? AND full >= ? AND queen >= ? AND king >= ? AND calking >=?', self.twin, self.twinXL, self.full, self.queen, self.king, self.calking ).first.warehouse_id

    send_order(warehouse_id, self.id)
  end

  def find_warehouse2(order_list)
   #order_list = {twin: 1, calking: 1}
   # reformat the keys so that you can do a query
   # plug into Inventory.where(str1 AND str2, val1, val2)

   # if there is a warehouse that has everything, send the order there
   #Inventory.where(str1 AND str2, v1,v2)
   query = ""
   order_list.each_with_index do |(k,v), index|
    if index == 0
      query += "#{k.to_s} >= ?"
    else
      query += " AND #{k.to_s} >= ?" 
    end
    #list_of_inventories.push(Inventory.where(str, v))
   end
   warehouse_id = Inventory.where(query, order_list.map{|k,v| v.to_i }.join(", ") ).first.warehouse_id

   # else - 

   list_of_inventories = []
   order_list.each_with_index do |(k,v), index|
    str = "#{k.to_s} >= ?"
    list_of_inventories.push(Inventory.where(str, v))
   end

  end

  def send_order(warehouse_id, order_id)
    Warehouse.find(warehouse_id).receive_order(order_id)
  end
end

