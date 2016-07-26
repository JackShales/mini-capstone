class CreateCategorizedDrinks < ActiveRecord::Migration
  def change
    create_table :categorized_drinks do |t|
      t.integer :category_id
      t.integer :drink_id

      t.timestamps null: false
    end
  end
end
