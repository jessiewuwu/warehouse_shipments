require 'rails_helper'
require "awesome_print"

describe Shipment do 
  before(:each) do
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse: @warehouse1)

    @twin = @inventory.products.create(warehouse_id: @warehouse1.id, size: "twin")
    @twin1 = @inventory.products.create(warehouse_id: @warehouse1.id, size: "twin")
    @twinXL = @inventory.products.create(warehouse_id: @warehouse1.id, size: "twinXL")
    @full = @inventory.products.create(warehouse_id: @warehouse1.id, size: "full")
    @calking = @inventory.products.create(warehouse_id: @warehouse1.id, size: "calking")
    @calking2 = @inventory.products.create(warehouse_id: @warehouse1.id, size: "calking")
    @calking3 = @inventory.products.create(warehouse_id: @warehouse1.id, size: "calking")
    @inventory.update_inventory
    @shipment = Shipment.create(warehouse_id: @warehouse1.id)
  end

  it 'is created when a warehouse receives an order' do
    @warehouse1.receive_order(@new_order.id)
    expect(Shipment.count).to eq 2
    expect(Shipment.last.warehouse_id).to eq @warehouse1.id
    expect(@inventory.twin).to eq 0
    expect(@inventory.products).to_not include([@twin, @twin1])
  end

  it 'adds products from inventory' do
    @shipment.add(@new_order.id)
    expect(@shipment.products.count).to eq 2
    expect(@shipment.products.first.shipment_id).to eq @shipment.id
  end

  it 'removes products from inventory' do
    @shipment.add(@new_order.id)
    @warehouse1.inventory.update_inventory

    expect(@shipment.products.first.inventory_id).to eq nil
    expect(@inventory.twin).to eq(0)
    expect(@inventory.products).to_not include(@twin)
  end

  it 'removes products from inventory' do 
    # p @inventory.products
    # p @inventory.products.include?(@twin) == true
    # p @inventory.products.include?(@twin1) == true
    @warehouse1.receive_order(@new_order.id)
    # p @inventory.products.include?(@twin) == false
    # p @inventory.products.include?(@twin1) == false
    # p @inventory.products
    # p @warehouse1.shipments

    expect(@inventory.products).to_not include(@twin)
    expect(@inventory.products).to_not include(@twin1)
  end

  it 'tests associations' do
    expect(@shipment.warehouse).to eq(@warehouse1)
    expect(@warehouse1.shipments).to include(@shipment)
    expect(@shipment.warehouse.inventory).to eq(@warehouse1.inventory)
    expect(@shipment.warehouse.inventory.products).to eq(@warehouse1.inventory.products)
    expect(@shipment.warehouse.inventory).to eq(@inventory)
  end

end


