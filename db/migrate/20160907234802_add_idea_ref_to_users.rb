class AddIdeaRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :idea, foreign_key: true
  end
end
