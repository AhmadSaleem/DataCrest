ActiveAdmin.register Client do

  index do
    selectable_column
    column :full_name
    column :email
    column :invited_by
    column :invited_by_type
    actions defaults: false do |client|
      item "View",   admin_client_path(client), class: 'member_link'
      item "delete", admin_client_path(client), method: :delete, data: { confirm: "Are you sure?"}, class: 'member_link'
    end
  end
end
