class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :inventory
      t.belongs_to :warehouse
      t.string :size

      t.timestamps null: false
    end
  end
end
