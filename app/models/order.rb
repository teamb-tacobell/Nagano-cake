class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :items, through: :order_items
  has_many :order_items
  has_many :order_details,  dependent: :destroy

  enum cash: { credit_card:0, transfer:1 }
  enum order_status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }

  def add_tax_tax_excluded_price
    tax_excluded_price * 1.10
  end

  def sum_of_items_price
    add_tax_tax_excluded_price * quantity
  end

#  def sum_of_order_price
#    sum_of_items_price + postage
#  end
end
