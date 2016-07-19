class AddSupplierIdtoDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :supplier_id, :integer
  end
end
