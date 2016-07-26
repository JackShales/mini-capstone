class Drink < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :categorized_drinks
  has_many :categories, through: :categorized_drinks
  has_many :carted_products
  has_many :orders, through: :carted_products

  def sale_message
    if price > 2.00
      message = "Premium Item"
    else
      message = "Discount Item!"
    end
  end

  def tax
    tax = price * 0.09 
    tax.round(2)
  end

  def total
    tax + price
  end

  def price_class_name
    if sale_message == "Discount Item!"
      class_name = "discount"
    else
      class_name = ""
    end
  end
end
