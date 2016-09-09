class AddCommentRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :comment, foreign_key: true
  end
end
