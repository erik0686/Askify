class AddPostTitleToPosts < ActiveRecord::Migration[5.1]
  def change
      add_column :posts, :post_title, :string
  end
end
