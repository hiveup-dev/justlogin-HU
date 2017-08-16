class Notifier < ApplicationMailer

  def notify_email(submission)
    @submission = submission
    puts 'inside email'
    mail(to: 'ivan@hive-up.com', subject: '[Notification] New User Submission', from: 'admin@hive-up.com')
  end

  def notify_signup(details)
    @details = details
    mail(to: 'ivan@hive-up.com', subject: '[SIGN UP] New User Sign Up', from: 'admin@hive-up.com')
  end
end
