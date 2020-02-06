# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# class Order
# 	def self.addItems(item)
# 			order_item = item.clone
# 			order_item.merge(order_id: self.id)
# 	end
# end

# def updateQty(order)
# 	order_items = order.items
# 	order_items.each do |item|
# 		origin = Location.find(order.origin_id)
# 		destination = Location.find(order.destination_id)
# 		origin_item = Item.find_or_create_by(location_id: origin.id)
# 		destination_item = Item.find_or_create_by(location_id: destination.id)
# 		destination_item.qty = destination_item.qty + item.qty
# 		origin_item.qty = origin_item.qty - item.qty
# 	end
# end

Account.destroy_all
Product.destroy_all
User.destroy_all
Event.destroy_all
Location.destroy_all
Item.destroy_all
Order.destroy_all
Assignment.destroy_all


Account.create(company_id: 'Premier Events', account_access_key: 1776, address: '1825 MacArthur Blvd NW Atlanta GA 30318')
account_id = Account.first.id

Product.create(account_id: account_id, name: '50pk - 12oz Clear Plastic cups', upc: '616932448706', image_url: 'https://partycity6.scene7.com/is/image/PartyCity/_pdp_sq_?$_100x100_$&$product=PartyCity/259325', description: '12 oz disposable plastic cups, Value pack of 50 cups', unit: "50")
product_id = Product.first.id

Product.create(account_id: account_id, name: 'Bar Shaker Set', upc: '755141103027', image_url: 'http://ecx.images-amazon.com/images/I/41QblGwtXsL._SL160_.jpg', description: 'Stainless Steel 3 Piece Bar Shaker Set', unit: "1")
product2_id = Product.second.id

Event.create(title: 'Music Midtown', address: 'Piedmont Park Atlanta', latitude: '', longitude: '', prev_year_event_id: '', start_date: '', end_date: '', account_id: account_id)
event_id = Event.first.id

Location.create(title: 'HQ', event_id: event_id)
location_id = Location.first.id

Location.create(title: 'warehouse', event_id: event_id)
loc2_id = Location.second.id

User.create!(account_id: account_id, email: 'harryk@gmail.com', password: 'harryk333', encrypted_password: 'harryk333')
user_id = User.first.id

Assignment.create(event_id: event_id, location_id: location_id, user_id: user_id, role: 'event_admin')

Item.create(product_id: product_id, location_id: location_id, quantity: 12, category: 'consumables')
item_id = Item.first.id

Item.create(product_id: product2_id, location_id: loc2_id, quantity: 2, category: 'supplies')
item2_id = Item.second.id

Order.create(message: 'I need 200 more cocktail cups, please', created_by: user_id, location_id: loc2_id)
order_id = Order.first.id

Transaction.create(item_id: item_id, qty: 4, origin_id: location_id, dest_id: loc2_id, status: 'Pending', order_id: order_id)
transaction_id = Transaction.first.id

