class Question < ApplicationRecord
	belongs_to :topic
	belongs_to :user
	has_many :answers, dependent: :destroy

	validates :question_text, presence:true
end
