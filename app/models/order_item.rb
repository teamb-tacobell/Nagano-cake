class OrderItem < ApplicationRecor
  belongs_to :order
  belongs_to :items

  enum making_status: { not_make: 0, wait_make: 1, now_make: 2, complete_make: 3}

  def sum_of_order_price
    purchase_price * quantity
  end

end
