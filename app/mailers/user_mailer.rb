class UserMailer < ApplicationMailer
  def welcome(email)
    mail(to: email, subject: "Welcome to DataCrest")
  end
end
