class HumanServiceApplication < ApplicationRecord
  has_many :planned_events
  has_many :applicant_employees

  belongs_to :client
  belongs_to :agent, optional: true

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
end
