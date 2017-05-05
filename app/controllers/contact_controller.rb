class ContactController < ApplicationController
  def create
    res = GoogleFormServices.submit_form(params)
    Rails.logger.debug(res.body)
    ContactMailer.has_response_on_google_form(params).deliver_now
    redirect_to '/'
  end
end
