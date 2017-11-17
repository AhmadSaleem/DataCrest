class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@mydatacrest.com',
          bcc:   Settings["bcc_emails"]
  layout 'mailer'
end
