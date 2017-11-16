ActiveAdmin.register Agency do
  permit_params :title, :owner_id, :website, :logo, :city, :zip_code, :state, :address_1, :address_2

  index do
    selectable_column
    column :title
    column :owner
    column :website do |agency|
      link_to(agency.website, "http://#{agency.website}", target: :blank) if agency.website.present?
    end
    column :company_address
    actions
  end

end
