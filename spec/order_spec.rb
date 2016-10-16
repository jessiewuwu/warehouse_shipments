# require 'rails_helper'

# describe Order do
#   before(:each) do
#     @new_order = Order.create
#     @new_order.new_order({twin: 2})
#     @warehouse1 = Warehouse.create
#     @inventory = Inventory.create(warehouse_id: 1)
#     @twin = Product.create(inventory_id: @inventory.id,size: "twin")
#     @twin1 = Product.create(inventory_id: @inventory.id,size: "twin")
#     @twinXL = Product.create(inventory_id: @inventory.id,size: "twinXL")
#     @full = Product.create(inventory_id: @inventory.id,size: "full")
#     @calking = Product.create(inventory_id: @inventory.id,size: "calking")
#     @calking2 = Product.create(inventory_id: @inventory.id,size: "calking")
#     @calking3 = Product.create(inventory_id: @inventory.id,size: "calking")
#     @inventory.update_inventory
#   end

#   it 'creates a new order' do
#     order2 = Order.create
#     order2.new_order({twin: 1, calking: 5})
#     expect(Order.all.count).to eq 2
#     expect(order2.twin).to eq 1
#     expect(order2.calking).to eq 5 
#   end

#   it 'finds the warehouse with the inventory' do
#     @new_order.find_warehouse
#   end
  
# end