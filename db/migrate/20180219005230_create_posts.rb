class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.date :expiry_date
      t.text :post_content

      t.timestamps
    end
  end
end
