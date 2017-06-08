class HomeController < ApplicationController

  def complete
    session.delete(:find_out_more)
    session.delete(:product_ids)
  end

  def contact
    @products = Refinery::Products::Product.where(id: session[:product_ids])
    @user_submission = Refinery::Products::UserSubmission.new
  end

  def main
    allproducts = Refinery::Products::Product.all.sort_by {|product| product.updated_at}
    substring = params['search']
    @products = Array.new
    if substring != nil
    allproducts.each do |product|
      name = product.name.downcase
        if name.include? substring
          @products.push(product)
        end
      # want to pick out products related to current user

    end
    else
      @products = allproducts
    end
  end

end
