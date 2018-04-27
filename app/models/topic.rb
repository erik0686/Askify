class Topic < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :questions

	validates :topic_name, presence: true
	validates :topic_name, uniqueness: true

	scope :by_id, -> { order(id: :asc) }
	scope :by_date_desc, -> { order(created_at: :desc )}

	def approve!
    update_attribute(:is_official, true)
  end

	def official?
		self.is_official
	end
end
