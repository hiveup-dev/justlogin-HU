Refinery::Authentication::Devise::UsersController.class_eval do
  before_action :set_user, only: [:edit, :update]
  before_action :exclude_password_assignment_when_blank!, :only => :update
  layout 'profile'
  def edit
  end

  def update
    @user.update user_params
    if @user.valid?
      @user.save
      redirect_to '/users/' + @user.id.to_s + '/edit', :flash => {:success => 'Updated successfully!'}
    else
      errorStr = ''
      @user.errors.full_messages.each do |msg|
        errorStr = errorStr + msg + "<br>"
      end
      redirect_to '/users/' + @user.id.to_s + '/edit', :flash => {:error => errorStr}
    end
  end

  private
  def exclude_password_assignment_when_blank!
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].except!(:password, :password_confirmation)
    end
  end

  def set_user
    @user = current_authentication_devise_user
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :username, :email, :full_name, :phone, :company)
  end

end
