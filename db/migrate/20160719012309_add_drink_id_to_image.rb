class AddDrinkIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :drink_id, :integer
  end
end
