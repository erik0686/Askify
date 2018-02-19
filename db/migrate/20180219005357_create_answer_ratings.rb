class CreateAnswerRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_ratings do |t|
      t.integer :rating

      t.timestamps
    end
  end
end
