class Comment < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :comment_text, presence: true

  scope :by_date, -> { order(created_at: :asc) }
end
