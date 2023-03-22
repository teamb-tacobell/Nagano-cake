class AddPurchasePriceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :purchase_price, :integer
  end
end
