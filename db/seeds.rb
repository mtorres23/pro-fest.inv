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

Client.delete_all
Event.delete_all
Location.delete_all
Item.delete_all
Category.delete_all
Order.delete_all


Client.create!(id: 1, company_id: '0058', access_key: 0000, address: '1825 MacArthur Blvd NW, Atlanta, GA 30318', latitude: '', longitude: '')
Event.create!(id: 1, title: 'Music Midtown', address: 'Piedmont Park', latitude: '', longitude: '', prev_year_event_id: '', start_date: '', end_date: '', client_id: 1)
Location.create!(id: 1, title: 'HQ', event_id: 1)
Location.create!(id: 2, title: 'warehouse', event_id: 1)

Category.create!(id: 1, name: 'beverages', location_id: 1)
Order.create(id: 1, content: 'hello', category_id: 1)
Item.create!(id: 1, title: 'Bud Light', qty: 50, order_id: 1)







