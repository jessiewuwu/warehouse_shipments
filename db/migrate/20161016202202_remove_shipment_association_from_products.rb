class RemoveShipmentAssociationFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :shipment_id
  end
end
