
FactoryGirl.define do
  factory :plan, :class => Refinery::Products::Plan do
    sequence(:icon_name) { |n| "refinery#{n}" }
  end
end

