# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/soon
  def soon
    NotificationMailer.soon
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/bill
  def bill
    NotificationMailer.bill
  end
end
