class HomeController < ApplicationController

  def complete
    session.delete(:find_out_more)
    session.delete(:product_ids)
  end

  def contact
    @products = Refinery::Products::Product.where(id: session[:product_ids])
    @user_submission = Refinery::Products::UserSubmission.new
  end
end
