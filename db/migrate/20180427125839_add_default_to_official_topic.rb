class AddDefaultToOfficialTopic < ActiveRecord::Migration[5.1]
  def up
    change_column :topics, :is_official, :boolean, default: false
  end
end
