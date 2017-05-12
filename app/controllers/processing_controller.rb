class ProcessingController < ApplicationController
  def step1
    session[:find_out_more] = params[:findoutmore]
    @benefits = Refinery::Products::Benefit.where(id: params[:findoutmore])
    redirect_to refinery.benefits_products_products_benefits_path(benefits: @benefits.map(&:friendly_id))
  end

  def step2
    session[:product_ids] = params[:product_ids]
    redirect_to '/confirm'
  end

  def step3
    @user_submission = Refinery::Products::UserSubmission.new(user_submission_params)
    @user_submission.plan_names = session[:find_out_more]
    @user_submission.products = Refinery::Products::Product.where(id: session[:product_ids])
    if params[:confirmation] == 'yes'
      reset_session
      redirect_to '/complete'
    else
      redirect_to '/confirm'
    end
  end

  private
  def user_submission_params
    params.require(:user_submission).permit([:first_name, :last_name, :email, :company, :phone_number, :other_inquiries])
  end
end
