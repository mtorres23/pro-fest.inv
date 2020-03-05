class Message < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :order, optional: true
  belongs_to :event
  validates_presence_of :text
  before_validation do
    if self.text == nil
      format_message(self)
    else
      info = "[#{DateTime.now.strftime("%I:%M%p on %m/%d/%Y")}] => #{user_data(self.created_by)[:full_name]}: "
      self.text = info + self.text
    end
  end

  def format_message(message)
    puts "inside format message"
    location = Location.find(message.location_id)
    order = message.order
    info = "[#{location.title}] #{DateTime.now.strftime("%I:%M%p on %m/%d/%Y")}: "
    case message.message_type
    when 'order_pending'
      self.text = info + "#{order.role.upcase} Order #{order.id} submitted by #{user_data(message.created_by)[:full_name]}"
    when 'order_submitted'
      self.text = info + "#{order.role.upcase} Order #{order.id} submitted by #{user_data(message.created_by)[:full_name]}"
    when 'order_completed'
      self.text = info + "#{order.role.upcase} Order #{order.id} completed by #{user_data(message.created_by)[:full_name]}"
    when 'order_delivered'
      self.text = info + "#{order.role.upcase} Order #{order.id} verified by #{user_data(message.created_by)[:full_name]}"
    when 'order_canceled'
      self.text = info + "#{order.role.upcase} Order #{order.id} canceled by #{user_data(message.created_by)[:full_name]}"
    when 'order_assigned'
      self.text = info + "#{user_data(order.assigned_to)[:full_name]} has been assigned to: Order #{order.id}"
    when 'item_reserved'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      self.text = info + "(#{transaction.qty}) #{item.product.name} marked reserved for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'item_pick_up'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      origin = Location.find(transaction.origin_id)
      self.text = info + "Order #{order.id} - #{user_data(message.created_by)[:full_name]} has picked up (#{transaction.qty}) #{item.product.name} from #{origin.title}"
    when 'item_drop_off'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      origin = Location.find(transaction.origin_id)
      destination = Location.find(transaction.dest_id)
      self.text = info + "Order #{order.id} - #{user_data(message.created_by)[:full_name]} has dropped off (#{transaction.qty}) #{item.product.name} to #{destination.title}"
    when 'transaction_updated'
    transaction = Transaction.find(message.transaction_id)
    self.text = info + "Transaction# #{transaction.id} has been updated: Status = #{transaction.status}, Item: #{find_order_item(order, transaction.item_id).product.name}, Qty: #{transaction.qty}"
  when 'inventory_updated'
    item = Item.find(message.item_id)
    transaction = Transaction.find(message.transaction_id)
    origin = Location.find(transaction.origin_id)
    destination = Location.find(transaction.dest_id)
    origin_item = Item.find_by(location_id: transaction.origin_id)
    dest_item = Item.find_by(location_id: transaction.dest_id)
    self.text = info + "#{origin.title} inventory has been updated: #{origin_item.product.name} = #{origin_item.quantity}, #{destination.title} inventory has been updated: #{dest_item.product.name} = #{dest_item.quantity}"
    end
  end

  private

  def user_data(user_id)
    user = User.find(user_id)
    return {
      full_name: "#{user.first_name} #{user.last_name}",
      details:user
    }
  end

  def find_order_item(order, item)
    return order.items.find(item)
  end

end
