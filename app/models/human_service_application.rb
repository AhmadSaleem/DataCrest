class HumanServiceApplication < ApplicationRecord
  has_many :planned_events
  has_many :applicant_employees

  has_one :insurance_application, as: :client_application

  belongs_to :client
  belongs_to :agent, optional: true

  delegate :full_name, to: :agent, allow_nil: true, prefix: true
  delegate :full_name, to: :client, prefix: true

  after_update :calculate_completion_percentage

  APPLICATION_TITLE = "Human Service Application"

  accepts_nested_attributes_for :applicant_employees, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :planned_events,      reject_if: :all_blank, allow_destroy: true

  enum fire_sprinkler:              { yes: 1, no: 2, not_available: 3}, _prefix: :true
  enum sprinkler_temperature:       { yes: 1, no: 2, not_available: 3}, _prefix: :minimum_temperature
  enum valves_exercised_annualy:    { yes: 1, no: 2, not_available: 3}, _prefix: :valves_exercised
  enum freeze_winterization_review: { yes: 1, no: 2, not_available: 3}, _prefix: :freeze_prevention
  enum ul_monitoring_company:       { yes: 1, no: 2, not_available: 3}, _prefix: :ul_monitered
  enum water_valves_accessible:     { yes: 1, no: 2, not_available: 3}, _prefix: :valves_accessible
  enum staff_qualified:             { yes: 1, no: 2, not_available: 3}, _prefix: :qualified_staff
  enum automatic_shutoff:           { yes: 1, no: 2, not_available: 3}, _prefix: :shutoff_automatically
  enum formal_process:              { yes: 1, no: 2, not_available: 3}, _prefix: :shutoff_process
  enum water_lines_temperature:     { yes: 1, no: 2, not_available: 3}, _prefix: :water_lines_fix_tem
  enum malpractice_insurance:       { yes: 1, no: 2, not_available: 3}, _prefix: :physicians_insurance

  def status
    percentage_of_completion == 100 ? 'complete' : "#{percentage_of_completion}% complete"
  end

  def complete?
    percentage_of_completion == 100
  end

  def application_title
    APPLICATION_TITLE
  end

  private

    def calculate_completion_percentage
      completion_percentage = (self.attributes.select{|k, v| v.present?}.size / self.attributes.size.to_f) * 100
      self.update_column(:percentage_of_completion, completion_percentage.to_i)
    end
end
