class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :postcode
      t.string :residence
      t.string :name
      t.integer :cash, default: 0
      t.integer :total_price
      t.integer :postage, default: 800
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
