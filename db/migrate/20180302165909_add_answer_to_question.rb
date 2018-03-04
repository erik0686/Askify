class AddAnswerToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :question_id, :integer, foreign_key: true, index: true
  end
end
