FactoryBot.define do
    factory :comment do
         comment_text { FFaker::Lorem.sentence }
         user_id 1
         answer_id 3
    end
  end