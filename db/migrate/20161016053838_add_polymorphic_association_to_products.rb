class AddPolymorphicAssociationToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.references :current_status, polymorphic: true, index:true
    end
  end
end
