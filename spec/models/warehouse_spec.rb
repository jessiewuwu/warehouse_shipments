require 'rails_helper'

describe Warehouse do 
  before(:each) do 
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: 1)

    @inventory.update_inventory
  end

  it 'gets order_id' do 
    #@warehouse1.receive_order(@new_order.id)
  end

end