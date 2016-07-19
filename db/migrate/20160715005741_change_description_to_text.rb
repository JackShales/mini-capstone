class ChangeDescriptionToText < ActiveRecord::Migration
  def change
    change_column :drinks, :description, :text
  end
end
