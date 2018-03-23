FactoryBot.define do
    factory :topic do
      topic_name { FFaker::Company.name }
         is_official true
         user_id 1
         category_id 1
    end
  end