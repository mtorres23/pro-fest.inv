module OrderHelper
  def order_types
    [
      ['Note'],
      ['Transfer In'],
      ['Transfer Out'],
      ['Comp'],
      ['Spill'],
      ['Return'],
      ['Damage'],
      ['Sale']
    ]
  end

  def statuses
    [
      ['Pending'],
      ['Canceled'],
      ['Completed'],
      ['Verified']
    ]

  end
end
