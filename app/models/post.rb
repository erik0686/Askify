class Post < ApplicationRecord
	belongs_to :user

	validates :expiry_date, :post_content, presence: true
end
