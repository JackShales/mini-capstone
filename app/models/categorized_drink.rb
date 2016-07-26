class CategorizedDrink < ActiveRecord::Base
  belongs_to :drink
  belongs_to :category
end
