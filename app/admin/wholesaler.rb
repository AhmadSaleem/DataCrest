ActiveAdmin.register Wholesaler do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :owner_id, :title, :logo, :website, :address_1, :address_2, :city, :state, :zip_code

  index do
    selectable_column
    column :title
    column :owner
    column :website do |wholesaler|
      link_to(wholesaler.website, "http://#{wholesaler.website}", target: :blank) if wholesaler.website.present?
    end
    column :company_address
    actions
  end

end
