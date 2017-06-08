Refinery::Authentication::Devise::User.class_eval do
  has_many :policies, class_name: 'Refeinery::Policies::Policy'
  has_many :employess, class_name: 'Refinery::Policies::Employee'
end
