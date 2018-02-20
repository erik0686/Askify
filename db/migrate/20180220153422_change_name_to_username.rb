class ChangeNameToUsername < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :username, :user_name
  end
end
