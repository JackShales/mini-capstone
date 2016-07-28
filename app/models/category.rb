class Category < ActiveRecord::Base
  has_many :categorized_drinks
  has_many :drinks, through: :categorized_drinks
  validates :name, uniqueness: true
end
