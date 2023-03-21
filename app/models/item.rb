class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_items

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :tax_excluded_price, presence: true

  def add_tax_tax_excluded_price
    (self.tax_excluded_price * 1.10).round
  end

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end