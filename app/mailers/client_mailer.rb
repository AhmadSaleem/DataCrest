class ClientMailer < ApplicationMailer
  def application_status(application_id)
    @application = InsuranceApplication.find(application_id)
    mail(to: @application.client_email, subject: 'Your Application Status')
  end
end
