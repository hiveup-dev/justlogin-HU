class Notifier < ApplicationMailer

  def notify_email(submission)
    @submission = submission
    puts 'inside email'
    mail(to: 'ivan@hive-up.com', subject: '[Notification] New User Submission', from: 'admin@hive-up.com')
  end
end
