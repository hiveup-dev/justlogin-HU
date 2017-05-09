
FactoryGirl.define do
  factory :user_submission, :class => Refinery::Products::UserSubmission do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

