class Topic < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :questions

	validates :topic_name, :is_official, presence: true
	validates :topic_name, uniqueness: true
end
