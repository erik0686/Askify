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
  has_many :answers, through: :answer_rating, class_name: "RatedAnswer"
  has_many :answers
  

  validates :student_id, :email, :user_name, uniqueness: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
