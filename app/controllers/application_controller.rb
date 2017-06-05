class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :create_hr_role
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    if resource.has_role?(:hruser)
      root_path
    else
      '/admin/products/feature_groups'
    end
  end

  private
  def create_hr_role
    Refinery::Authentication::Devise::Role.[]('Hruser')
  end
end
