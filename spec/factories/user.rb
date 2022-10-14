FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@product_catalogue.com" }
    password { "123456" }
  end
end