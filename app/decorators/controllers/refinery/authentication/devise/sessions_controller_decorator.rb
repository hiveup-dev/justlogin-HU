Refinery::Authentication::Devise::SessionsController.class_eval do
  #skip_before_filter :require_no_authentication
  def new_hr_user
  end
end
