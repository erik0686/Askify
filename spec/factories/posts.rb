FactoryBot.define do
    factory :post do
         expiry_date '2/12/2019'
         post_content { FFaker::Lorem.paragraph }
         user_id 2
    end
  end