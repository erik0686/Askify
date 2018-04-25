FactoryBot.define do
    factory :category do
      category_name { FFaker::Company.name }
      description { FFaker::Lorem.sentence }
    end
  end