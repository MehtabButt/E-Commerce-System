class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.boolean :availability
      t.integer :count
      t.references :seller, foreign_key: { to_table: :users }, index: true, null: false 

      t.timestamps
    end
  end
end
