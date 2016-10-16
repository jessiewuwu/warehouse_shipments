class AddAssociationsToShipmentsAndProducts < ActiveRecord::Migration
  def change
    add_reference :products, :shipment, index:true
  end
end
