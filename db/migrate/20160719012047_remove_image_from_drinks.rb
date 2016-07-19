class RemoveImageFromDrinks < ActiveRecord::Migration
  def change
    remove_column :drinks, :image, :string
  end
end
