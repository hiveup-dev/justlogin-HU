
FactoryGirl.define do
  factory :benefit, :class => Refinery::Products::Benefit do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

