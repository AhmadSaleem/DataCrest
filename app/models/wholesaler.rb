class Wholesaler < ApplicationRecord
  has_many :salespeople, dependent: :destroy

  belongs_to :salesperson_owner, class_name: "Salesperson", foreign_key: :owner_id
end
