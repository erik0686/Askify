class Notification < ApplicationRecord
	belongs_to :user

	validates :read, :notification_text, :notification_type,  presence: true

end
