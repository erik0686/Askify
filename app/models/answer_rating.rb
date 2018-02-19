class AnswerRating < ApplicationRecord
	belongs_to :answer
	belongs_to :user

	validates :rating, presence: true
	validates_associated :answer, :user
end
