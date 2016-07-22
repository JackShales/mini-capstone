class ChangeOrdersProductIdToDrinkId < ActiveRecord::Migration
  def change
    rename_column :orders, :product_id, :drink_id
  end
end
