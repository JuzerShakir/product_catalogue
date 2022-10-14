FactoryBot.define do
  factory :property do
    sequence(:name) { |n| "property_#{n}" }
  end
end
