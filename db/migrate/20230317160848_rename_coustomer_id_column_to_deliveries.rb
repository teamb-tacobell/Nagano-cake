class RenameCoustomerIdColumnToDeliveries < ActiveRecord::Migration[6.1]
  def change
    rename_column :deliveries, :coustomer_id, :customer_id
  end
end
