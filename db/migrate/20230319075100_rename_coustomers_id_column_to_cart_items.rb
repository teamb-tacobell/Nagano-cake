class RenameCoustomersIdColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :coustomers_id, :customer_id
  end
end
