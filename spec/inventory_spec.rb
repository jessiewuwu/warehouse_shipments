require 'rails_helper'

describe Inventory do 
  before(:each) do
    @new_order = Order.create(full: 1, twinXL: 2)
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: 1)
    @twin = Product.create(size: "twin")
    @twin1 = Product.create(size: "twin")
    @twinXL = Product.create(size: "twinXL")
    @full = Product.create(size: "full")
    @calking = Product.create(size: "calking")
    @calking2 = Product.create(size: "calking")
    @calking3 = Product.create(size: "calking")
  end

  it "has no products in its inventory" do 
    expect(@inventory.products.count).to eq 0
  end

  it "updates its inventory count" do 
    @twin.update_attributes(inventory: @inventory)
    @twin1.update_attributes(inventory: @inventory)
    @twinXL.update_attributes(inventory: @inventory)
    @calking.update_attributes(inventory: @inventory)
    @inventory.update_inventory

    expect(@inventory.products.count).to eq 4
    expect(@inventory.twin).to eq 2
    expect(@inventory.twinXL).to eq 1
    expect(@inventory.full).to eq 0
    expect(@inventory.calking).to eq 1
  end

end