class ContactMailer < ApplicationMailer
  default to: ['doantranquy@gmail.com'], from: 'hiveupnotificationemail@gmail.com'

  def has_response_on_google_form(submit_info)
    @submit_info = submit_info
    mail(subject: 'Someone has response to HiveUp JustLogin')
  end
end
