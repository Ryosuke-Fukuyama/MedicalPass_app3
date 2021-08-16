class NotificationMailer < ApplicationMailer
  def soon_mail(health_interview, email)
    @id = health_interview.id
    @email = email
    # @greeting = ""

    mail to: @email, subject: t('views.messages.soon_mail')
  end

  def bill_mail(health_interview, email)
    @id = health_interview.id
    @price = health_interview.price
    @email = email
    # @greeting = ""

    mail to: @email, subject: t('views.messages.bill_mail')
  end
end
