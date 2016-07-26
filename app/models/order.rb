class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :drinks, through: :carted_products

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end
end
