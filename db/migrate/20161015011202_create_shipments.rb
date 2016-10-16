class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.belongs_to :warehouse
      t.timestamps null: false
    end
  end
end
