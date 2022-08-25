class AddRepliesToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :comment, foreign_key: { to_table: :comments }, index: true, null: true 
  end
end
