class Question < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
end
