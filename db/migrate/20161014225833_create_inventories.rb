class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.belongs_to :warehouse
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
