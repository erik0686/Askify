class Category < ApplicationRecord
	has_many :topics

	validates :category_name, presence: true
	validates :category_name, uniqueness: true
end
