FactoryBot.define do
    factory :category do
      category_name { FFaker::Company.name }
    end
  end