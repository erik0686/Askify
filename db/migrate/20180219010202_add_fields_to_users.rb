class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :birth_date, :string
  	add_column :users, :major, :string
  	add_column :users, :username, :string
  	add_column :users, :student_id, :string
  end
end
