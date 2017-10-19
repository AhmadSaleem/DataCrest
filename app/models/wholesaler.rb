class Wholesaler < ApplicationRecord
  has_many :salespeople, dependent: :destroy
  has_many :application_templates, dependent: :destroy

  belongs_to :owner, class_name: "Salesperson"

  validates :title, presence: true
end
