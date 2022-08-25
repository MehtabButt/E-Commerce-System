class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :shiped
      t.references :buyer, null: false, foreign_key: { to_table: :users }, index: false 
      t.references :seller, null: false, foreign_key: { to_table: :users }, index: false
      t.index [:buyer_id, :seller_id]

      t.timestamps
    end
  end
end
