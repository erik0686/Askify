class RelateCommentToUserAndAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_id, :integer, foreign_key: true, index: true
    add_column :comments, :answer_id, :integer, foreign_key: true, index: true
  end
end
