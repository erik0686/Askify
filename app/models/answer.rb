class Answer < ApplicationRecord
	belongs_to :question
	belongs_to :user
	has_many :comments
	has_many :users, through: :answer_rating

	validates :answer_text, presence: true
	validates_associated :question
end
