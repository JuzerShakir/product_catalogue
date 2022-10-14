FactoryBot.define do
  factory :product_property do
    association :product, factory: :product
    association :property, factory: :property
    value { "ABC" }
  end
end
