# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
drink = Drink.new(name: "Cold Brew Coffee", price: "$4.25", image: "https://buyourbottles.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/2/12ozheritage_bottle_0511f_rgb_fnl.jpg", description: "Bottled 100% arabica 12-hour cold-brewed coffee.")
drink.save

drink = Drink.new(name: "Decaf Cold Brew Coffee", price: "$4.25", image: "https://buyourbottles.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/2/12ozheritage_bottle_0511f_rgb_fnl.jpg", description: "Bottled and naturally decaffeinated 100% arabica 12-hour cold-brewed coffee.")
drink.save

drink = Drink.new(name: "Black Tea", price: "$3.75", image: "https://buyourbottles.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/2/12ozheritage_bottle_0511f_rgb_fnl.jpg", description: "Indian Assam tea with lemon.")
drink.save