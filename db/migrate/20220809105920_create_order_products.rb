class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :product_count
      t.decimal :price
      t.belongs_to :order, null: false, foreign_key: true, index: false 
      t.belongs_to :product, null: false, foreign_key: true, index: false 
      t.index [:order_id, :product_id], unique: true 

      t.timestamps
    end
  end
end
