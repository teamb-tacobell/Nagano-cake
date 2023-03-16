class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.text :image
      t.integer :tax_excluded_price
      t.boolean :is_sold, dafault: false

      t.timestamps
    end
  end
end
