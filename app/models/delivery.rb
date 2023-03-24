class Delivery < ApplicationRecord

   belongs_to :customer

  validates :postcode,presence:true
  validates :residence,presence:true
  validates :name,presence:true

end
