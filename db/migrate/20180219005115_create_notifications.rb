class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.text :notification_text
      t.string :notification_type

      t.timestamps
    end
  end
end
