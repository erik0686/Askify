class AddDefaultMajorToUser < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :major, :string, default: "ITC"
  end
end
