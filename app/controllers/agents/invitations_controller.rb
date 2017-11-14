class Agents::InvitationsController < Devise::InvitationsController

  def update
    super
    if resource.invitation_accepted_at?
      if resource.invited_by.is_a?(Agent)
        UserMailer.welcome(resource.email).deliver_later
        Agency::AgencyMailer.agent_invite_accept(resource).deliver_later
      else
        resource.wholesalers << resource.invited_by.wholesaler
        resource.agency_applications.update_all(agency_id: @agency.id) if resource.agency_applications.present?
        UserMailer.welcome(resource.email).deliver_later
        CompanyOwnerMailer.agent_invite_accept(resource).deliver_later
      end
    end
  end

  private

    def update_resource_params
      params.require(:agent).permit(:password, :password_confirmation, :invitation_token, :profile_picture, :profile_picture_cache,
                                    owned_agency_attributes: [:id, :title, :city, :zip_code, :state, :website, :address_1,
                                    :address_2, :logo])
    end
end
