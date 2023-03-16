class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :coustomer_id
      t.string :postcode
      t.string :residence
      t.string :name
      t.timestamps
    end
  end
end
