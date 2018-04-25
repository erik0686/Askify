class AddImageToPost < ActiveRecord::Migration[5.1]
  def up
    add_attachment :posts, :avatar
  end
end
