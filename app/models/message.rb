class Message < ApplicationRecord
  belongs_to :location
  belongs_to :order
  belongs_to :event
  validates_presence_of :text
  before_validation do
    format_message(self)
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
    when 'order_verified'
      self.text = info + "#{order.role.upcase} Order #{order.id} verified by #{user_data(message.created_by)[:full_name]}"
    when 'order_canceled'
      self.text = info + "#{order.role.upcase} Order #{order.id} canceled by #{user_data(message.created_by)[:full_name]}"
    when 'item_reserved'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      self.text = info + "(#{transaction.qty}) #{item.product.name} marked reserved for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'item_pick_up'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      self.text = info + "(#{transaction.qty}) #{item.product.name} has been picked up for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'item_drop_off'
      item = Item.find(message.item_id)
      transaction = Transaction.find(message.transaction_id)
      self.text = info + "(#{transaction.qty}) #{item.product.name} has been dropped off up for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'transaction_updated'
    transaction = Transaction.find(message.transaction_id)
    self.text = info + "Transaction# #{transaction.id} has been updated: Status = #{transaction.status}, Item: #{find_order_item(order, transaction.item_id).product.name}, Qty: #{transaction.qty}"
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
