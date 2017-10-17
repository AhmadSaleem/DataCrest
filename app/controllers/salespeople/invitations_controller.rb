class Salespeople::InvitationsController < Devise::InvitationsController
  def update
    super
    if resource.invitation_accepted_at?
      CompanyOwnerMailer.salesperson_invite_accept(resource).deliver_later
      UserMailer.welcome(resource.email).deliver_later
    end
  end
end
