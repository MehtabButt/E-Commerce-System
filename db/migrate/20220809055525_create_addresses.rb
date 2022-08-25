class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.integer :zipcode
      t.string :street_address
      t.belongs_to :user, foreign_key: true, index: true, null: false 

      t.timestamps
    end
  end
end
