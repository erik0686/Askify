class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :comments
  has_many :posts
  has_many :notifications, dependent: :destroy
  has_many :questions
  has_many :answers
  has_many :answers, through: :answer_rating, class_name: "RatedAnswer"

  validates :name, :student_id, :email, :username, uniqueness: true
end
