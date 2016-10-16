require 'rails_helper'

describe Inventory do 
  before(:each) do
    @new_order = Order.create
    @new_order.new_order({twin: 1, full: 1})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: @warehouse1.id)
    @shipment = Shipment.create(warehouse_id: @warehouse1.id)

    @twin = Product.create(size: "twin")
    @twin1 = Product.create(size: "twin")
    @twinXL = Product.create(size: "twinXL")
    @full = Product.create(size: "full")
    @calking2 = Product.create(size: "calking")
    @calking3 = Product.create(size: "calking")

    @inventory.update_inventory
  end

  it "has no products in its inventory" do 
    expect(@inventory.products.count).to eq(0)
  end

  it "updates its own inventory count" do 
    @twin.update_attributes(current_status: @inventory)
    @full.update_attributes(current_status: @inventory)
    @inventory.update_inventory

    expect(@inventory.products.count).to eq(2)
    expect(@twin.current_status).to eq(@inventory)
  end

  it "updates its inventory count after products are moved there" do 
    @warehouse2 = Warehouse.create
    @inventory2 = Inventory.create(warehouse_id: @warehouse2.id)
    @calking = Product.create(size: "calking", current_status: @inventory)
    @calking.update_attributes(current_status: @inventory2)
    @calking2.update_attributes(current_status: @inventory2)
    @inventory.update_inventory
    @inventory2.update_inventory

    expect(@inventory.products).to_not include([@calking, @calking2])
    expect(@inventory.calking).to eq(0)
    expect(@inventory2.calking).to eq(2)
    expect(@calking.current_status).to eq(@inventory2)
    expect(@calking2.current_status).to eq(@inventory2)
  end

end