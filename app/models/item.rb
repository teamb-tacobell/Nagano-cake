class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :tax_excluded_price, presence: true
  validates :is_sold, presence: true

end
