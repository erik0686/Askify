class AddAttributeToQuestion < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :question_title, :string
  end
end
