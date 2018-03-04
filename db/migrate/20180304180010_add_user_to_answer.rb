class AddUserToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :user_id, :integer, foreign_key: true, index: true
  end
end
