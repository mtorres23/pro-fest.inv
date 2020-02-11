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
end
