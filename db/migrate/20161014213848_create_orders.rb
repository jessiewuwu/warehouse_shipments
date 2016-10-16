class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :twin
      t.integer :twinXL
      t.integer :full
      t.integer :queen
      t.integer :king
      t.integer :calking
      t.timestamps null: false
    end
  end
end
