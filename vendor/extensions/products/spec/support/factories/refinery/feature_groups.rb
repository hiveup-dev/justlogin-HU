
FactoryGirl.define do
  factory :feature_group, :class => Refinery::Products::FeatureGroup do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

