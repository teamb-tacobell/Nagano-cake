class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy
  has_many :order_details,  dependent: :destroy

  enum cash: { credit_card:0, transfer:1 }
  enum order_status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }

  validates :postcode, presence: true
  validates :residence, presence: true
  validates :name, presence: true

end
