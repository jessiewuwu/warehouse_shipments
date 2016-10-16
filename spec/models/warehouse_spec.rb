require 'rails_helper'

describe Warehouse do 
  before(:each) do 
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: 1)
    @twin = Product.create(inventory: @inventory,size: "twin")
    @twin1 = Product.create(inventory: @inventory,size: "twin")
    @twinXL = Product.create(inventory: @inventory,size: "twinXL")
    @full = Product.create(inventory: @inventory,size: "full")
    @calking = Product.create(inventory: @inventory,size: "calking")
    @calking2 = Product.create(inventory: @inventory,size: "calking")
    @calking3 = Product.create(inventory: @inventory,size: "calking")
    @inventory.update_inventory
  end

  it 'gets order_id' do 
    #@warehouse1.receive_order(@new_order.id)
  end

end