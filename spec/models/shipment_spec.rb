require 'rails_helper'
require "awesome_print"

describe Shipment do 
  before(:each) do
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: @warehouse1.id)
    @shipment = Shipment.create(warehouse_id: @warehouse1.id)

    @twin = Product.create(size: "twin", current_status: @inventory)
    @twin1 = Product.create(size: "twin", current_status: @inventory)
    @twinXL = Product.create(size: "twinXL", current_status: @inventory)
    @full = Product.create(size: "full", current_status: @inventory)
    @calking = Product.create(size: "calking", current_status: @inventory)
    @calking2 = Product.create(size: "calking", current_status: @inventory)
    @calking3 = Product.create(size: "calking", current_status: @inventory)
    @inventory.update_inventory
  end

  it 'is created when a warehouse receives an order' do
    @warehouse1.receive_order(@new_order.id)
    @inventory.update_inventory

    expect(Shipment.count).to eq 2
    expect(Shipment.last.warehouse_id).to eq @warehouse1.id
  end

  it 'adds products from inventory' do
    @shipment.add(@new_order.id)
    @inventory.update_inventory
    expect(@shipment.products.count).to eq 2
  end

  it 'removes products from inventory' do
    @warehouse1.receive_order(@new_order.id)
    @inventory.update_inventory
    expect(@inventory.products).to_not include([@twin, @twin1])
    expect(@warehouse1.shipments.last.products.count).to eq(2)
    expect(@inventory.twin).to eq(0)
  end


  it 'tests associations' do 
    @shipment.add(@new_order.id)
    expect(@shipment.warehouse).to eq(@warehouse1)
    expect(@inventory.warehouse).to eq(@warehouse1)
  end

end


