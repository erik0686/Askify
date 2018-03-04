class AddUserAndCategoryToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :user_id, :integer, foreign_key: true, index: true
    add_column :topics, :category_id, :integer, foreign_key: true, index: true
  end
end
