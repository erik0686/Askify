class AddAvatarToUser < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :avatar
  end
end
