class AddDefaultValueToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :twin, :integer, :default => 0
    change_column :orders, :twinXL, :integer, :default => 0
    change_column :orders, :full, :integer, :default => 0
    change_column :orders, :queen, :integer, :default => 0
    change_column :orders, :king, :integer, :default => 0
    change_column :orders, :calking, :integer, :default => 0
  end
end
