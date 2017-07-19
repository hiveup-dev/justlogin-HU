Refinery::Authentication::Devise::SessionsController.class_eval do
  layout 'login'
  def new_hr_user
    new
  end
end
