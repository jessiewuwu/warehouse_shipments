class RemoveOldForeignKeysOfProducts < ActiveRecord::Migration
  def change
    remove_column :products, :warehouse_id
    remove_column :products, :inventory_id
  end
end
