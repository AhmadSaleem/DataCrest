class Application < ApplicationRecord
  has_many :application_fields, dependent: :destroy

  belongs_to :client
  belongs_to :agent
  belongs_to :application_template

  after_create :insert_application_fields

  accepts_nested_attributes_for :application_fields

  def insert_application_fields
    application_template.template_fields.each do |field|
      application_fields.create(template_field: field)
    end
  end
end
