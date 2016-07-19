class ChangePriceDecimalScale < ActiveRecord::Migration
  def change
    change_column :drinks, :price, :decimal, precision: 5, scale: 2
  end
end
