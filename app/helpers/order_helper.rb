module OrderHelper
  def order_types
    [
      ['note'],
      ['transfer'],
      ['comp'],
      ['spill'],
      ['return'],
      ['damage'],
      ['sale']
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

  def process_transactions(transactions)
    transactions.each do |t|
     handle_order_by_type(t)
    end
  end

  def handle_order_by_type(transaction)
    case transaction.order.role
    when 'transfer'
      move(transaction)
    when 'sale'
    when 'note'
    else
    end
  end

  def move(transaction)
    loc1 = Location.find(transaction.origin_id)
    loc1item = loc1.items.find_by(product_id: transaction.item.product_id)
    puts loc1item.quantity
    loc1item.update(quantity: loc1item.quantity - transaction.qty)
    puts loc1item.quantity
    loc2 = Location.find(transaction.dest_id)
    loc2item = loc2.items.find_by(product_id: transaction.item.product_id)
    puts loc2item.quantity
    loc2item.update(quantity: loc2item.quantity + transaction.qty)
    puts loc2item.quantity
  end

  def loss(transaction)
    waste = transaction.order.location.event.locations.find_by(loc_type: "waste")
    loc1 = transaction.location
    loc1item = loc1.items.find_by(product_id: transaction.item.product_id)
    puts loc1item.quantity
    loc1item.update(quantity: loc1item.quantity - transaction.qty)

  end

  def sale(transaction)
  end

  def no_change(transaction)
  end
end
