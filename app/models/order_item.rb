class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { not_make: 0, wait_make: 1, now_make: 2, complete_make: 3}

  def sum_price
    add_tax_excluded_price * quantity
  end

end
