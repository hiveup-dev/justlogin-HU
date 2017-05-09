class HomeController < ApplicationController

  def complete
    session.delete(:find_out_more)
    session.delete(:product_ids)
  end
end
