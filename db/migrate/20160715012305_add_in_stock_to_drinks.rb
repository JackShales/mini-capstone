class AddInStockToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :in_stock, :boolean
  end
end
