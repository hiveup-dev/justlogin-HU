
FactoryGirl.define do
  factory :product_feature, :class => Refinery::Products::ProductFeature do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

