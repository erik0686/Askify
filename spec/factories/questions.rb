FactoryBot.define do
  factory :question do
    question_title { FFaker::Company.name }
   	question_text { FFaker::Lorem.paragraph }
   	user_id 2
   	topic_id 1
  end
end