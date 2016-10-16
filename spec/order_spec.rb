require 'rails_helper'

describe Order do
  before(:each) do
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: 1)
    @twin = Product.create(size: "twin", current_status: @inventory)
    @twin1 = Product.create(size: "twin", current_status: @inventory)
    @twinXL = Product.create(size: "twinXL", current_status: @inventory)
    @inventory.update_inventory
  end

  it 'creates a new order' do
    order2 = Order.create
    order2.new_order({twin: 1, calking: 5})
    expect(Order.all.count).to eq 2
    expect(order2.twin).to eq 1
    expect(order2.calking).to eq 5 
  end

  it 'finds the warehouse with the inventory and sends the order to the warehouse' do
    expect(@new_order).to receive(:send_order).with(@warehouse1.id, @new_order.id)
    @new_order.find_warehouse
  end

  it 'sends the order to the warehouse' do 
    # expect(@warehouse1).to receive(:receive_order).with(@new_order.id)
    # @new_order.send_order(@warehouse1.id, @new_order.id)

  end
  
end