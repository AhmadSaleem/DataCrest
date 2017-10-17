class SalespersonMailer < ApplicationMailer
  def invitation_instructions(salesperson_id, token)
    @salesperson = Salesperson.find(salesperson_id)
    @token =  token
    mail(to: @salesperson.email, subject: "Invitation instructions")
  end
end
