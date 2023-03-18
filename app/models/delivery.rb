class Delivery < ApplicationRecord
  
  validates :postcode,presence:true
  validates :residence,presence:true
  validates :name,presence:true
  
end
