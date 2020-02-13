module OrderHelper
  def order_types
    [
      ['note'],
      ['transfer'],
      ['comp'],
      ['spill'],
      ['return'],
      ['damage'],
      ['sale'],
      ['load_in'],
      ['load_out']
    ]
  end

  def statuses
    [
      ['pending'],
      ['canceled'],
      ['completed'],
      ['verified']
    ]
  end

  def handle_order(order)
    if order.role == 'note'
      return order.update(status: 'verified', verified_by: current_user.id, assigned_to: current_user.id)
    elsif order.role != 'note' and order.transactions.length == 0
      return order.update(status: 'canceled', verified_by: current_user.id)
    else
      order.transactions.each do |t|
      process_transaction(t)
      end
      order.update(status: 'verified', verified_by: current_user.id)
    end
  end

  private

  def get_event_locations(transaction)
    return transaction.order.location.event.locations
  end

  def get_loc_by_type(type, locations)
    return locations.find_by(loc_type: type)
  end

  def find_item_match(location, transaction)
    return location.items.find_or_create_by(product_id: transaction.item.product_id)
  end

  def process_transaction(transaction)
    event_locations = get_event_locations(transaction)
    sales_location = get_loc_by_type('sales', event_locations)
    warehouse_location = get_loc_by_type('warehouse', event_locations)
    comps_location = get_loc_by_type('comps', event_locations)
    case transaction.order.role
    when 'transfer'
      @origin = event_locations.find(transaction.origin_id)
      @destination = event_locations.find(transaction.dest_id)
    when 'sale'
      @origin = transaction.order.location
      @destination = find_item_match(sales_location, transaction).location
    when 'void'
      @origin = find_item_match(sales_location, transaction).location
      @destination = transaction.order.location
    when 'load_in'
      @origin = find_item_match(warehouse_location, transaction).location
      @destination = event_locations.find(transaction.order.location_id)
    when 'load_out'
      @origin = transaction.order.location
      @destination = find_item_match(warehouse_location, transaction).location
    when 'comp', 'damage', 'spill', 'return'
      @origin = transaction.order.location
      @destination = find_item_match(comps_location, transaction).location
    else
      return
    end
    transaction.update(origin_id: @origin.id, dest_id: @destination.id)
    return update_inventories(transaction, @origin, @destination)
  end

def update_inventories(t, origin, destination)
  puts t.order.role + ':' + ' Processing transaction for: ' + t.qty.to_s + ' ' + t.item.product.name + ' at ' + t.order.location.title.to_s
  origin_item = find_item_match(origin, t)
  dest_item = find_item_match(destination, t)
  origin_qty = origin_item.quantity || 0;
  puts 'this is the original origin qty: ' + origin_qty.to_s
  dest_qty = dest_item.quantity || 0;
  puts 'this is the original destination qty: ' + dest_qty.to_s
  puts 'UPDATING......'
  origin_item.update(quantity: origin_qty - t.qty)
  dest_item.update(quantity: dest_qty + t.qty)
  puts 'this is the NEW origin qty: ' + find_item_match(origin, t).quantity.to_s
  puts 'this is the NEW destination qty: ' + find_item_match(destination, t).quantity.to_s
end


end
