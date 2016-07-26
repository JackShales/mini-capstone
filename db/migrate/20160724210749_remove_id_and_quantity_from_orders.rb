class RemoveIdAndQuantityFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :drink_id, :integer
    remove_column :orders, :quantity, :integer
  end
end
