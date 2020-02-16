class Message < ApplicationRecord
  belongs_to :location
  belongs_to :order
  belongs_to :event
  belongs_to :item

  before_create do
    format_message(self)
  end

  def format_message(message)
    info = "##{message.id} [#{location.title}] #{message.created_at.strftime("%I:%M%p on %m/%d/%Y")} :"
    location = message.event.locations.find(message.location_id)
    order = message.order
    case message.type
    when 'order_submitted'
      self.text = info + "#{order.role.upcase} Order #{order.id} submitted by #{user_data(message.created_by)[:full_name]}"
    when 'order_confirmed'
      self.text = info + "#{order.role.upcase} Order #{order.id} confirmed by #{user_data(message.created_by)[:full_name]}"
    when 'order_verified'
      self.text = info + "#{order.role.upcase} Order #{order.id} verified by #{user_data(message.created_by)[:full_name]}"
    when 'order_canceled'
      self.text = info + "#{order.role.upcase} Order #{order.id} canceled by #{user_data(message.created_by)[:full_name]}"
    when 'item_reserved'
      item = message.item
      self.text = info + "#{item.product.name} has been reserved for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'item_pick_up'
      item = message.item
      self.text = info + "#{item.product.name} has been picked up for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'item_drop_off'
      item = message.item
      self.text = info + "#{item.product.name} has been dropped off up for Order #{order.id} by #{user_data(message.created_by)[:full_name]}"
    when 'transaction_updated'
    transaction = message.transaction
    self.text = info + "Transaction# #{transaction.id} has been updated: Status = #{transaction.status}, Item: #{find_order_item(transaction.item_id).product.name}, Qty: #{transaction.qty}"
    end
  end

  def user_data(user_id)
    user = User.find(user_id)
    return {
      full_name: "#{user.first_name} #{user.last_name}",
      details:user
    }
  end

  def find_order_item(item)
    return Item.find(item)
  end

end
