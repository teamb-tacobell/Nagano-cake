class AddProductionStatusToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :production_status, :integer
  end
end
