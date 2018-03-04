class AddUserToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :user_id, :integer, foreign_key: true, index: true
  end
end
