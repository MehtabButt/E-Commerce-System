class ChangeReviewInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :review, :reply
  end
end
