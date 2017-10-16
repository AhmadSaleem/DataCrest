class Salesperson < ApplicationRecord
  has_one :owned_wholesaler, class_name: "Wholesaler", foreign_key: :owner_id, inverse_of: :salesperson_owner

  belongs_to :wholesaler
end
