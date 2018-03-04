class AddTopicAndUserToQuestions < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :user_id, :integer, foreign_key: true, index: true
  	add_column :questions, :topic_id, :integer, foreign_key: true, index: true
  end
end
