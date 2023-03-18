class OrderItem < ApplicationRecor
  belongs_to :order
  belongs_to :items
end
