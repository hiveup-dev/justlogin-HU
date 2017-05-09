class HomeController < ApplicationController

  def complete
    session.delete(:find_out_more)
    session.delete(:product_ids)
  end

  def contact
    @user_submission = Refinery::Products::UserSubmission.new
  end
end
