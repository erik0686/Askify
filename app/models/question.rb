class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  scope :by_date, -> { order(created_at: :desc) }
end
