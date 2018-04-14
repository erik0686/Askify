class AddDescriptionToTopicAndCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :description, :text
    add_column :topics, :description, :text
  end
end
