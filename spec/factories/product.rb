FactoryBot.define do
  factory :product do
    association :user, factory: :user
    sequence(:name) { |n| "product_#{n}"}
    # name { "MyString" }
    sequence(:upc, 1000000000).to_s
    # upc { "MyString" }
    available_on { Date.tomorrow }
  end
end
