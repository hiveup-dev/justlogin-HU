class ProcessingController < ApplicationController
  def step1
    session[:find_out_more] = params[:findoutmore]
    redirect_to '/products'
  end

  def step2
    session[:product_ids] = params[:product_ids]
    redirect_to '/confirm'
  end
end
