class HumanServiceApplication < ApplicationRecord
  has_many :planned_events
  has_many :applicant_employees
end
