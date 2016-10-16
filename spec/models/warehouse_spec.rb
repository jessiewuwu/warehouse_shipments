require 'rails_helper'

describe Warehouse do 
  before(:each) do 
    @new_order = Order.create
    @new_order.new_order({twin: 2})
    @warehouse1 = Warehouse.create
    @inventory = Inventory.create(warehouse_id: 1)
    @twin = Product.create(size: "twin", current_status: @inventory)
    @twin1 = Product.create(size: "twin", current_status: @inventory)
    @inventory.update_inventory
  end

  context 'receives the order, ' do
    before(:each) do 
      @warehouse1.receive_order(@new_order.id)
    end 

    it 'creates a shipment' do
      expect(Shipment.count).to eq(1)
    end

    it 'adds the order to the shipment' do
      # @warehouse1.receive_order(@new_order.id)
      # expect(@warehouse1.shipments.first).to receive(:add).with(@new_order.id)
    end

    it 'fulfills the shipment with the order' do 
      expect(Shipment.last.products.count).to eq(2)
      expect(Product.last.current_status).to eq(Shipment.last)
    end

    it 'updates the inventory after the shipment is fulfilled' do 
      @inventory.update_inventory
      expect(@inventory.twin).to eq(0)
    end

  end


end