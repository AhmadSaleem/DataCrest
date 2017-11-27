class CreateHumanServiceApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :human_service_applications do |t|
      t.string  :applicant_name
      t.string  :mailing_address
      t.string  :city
      t.integer :zip_code
      t.string  :state

      t.integer :full_time_staff
      t.integer :part_time_staff
      t.integer :sic_number
      t.integer :fein_number
      t.string  :website
      t.boolean :non_profit, default: false
      t.boolean :for_profit, default: false
      t.float   :annual_revenue
      t.integer :operational_years
      t.integer :current_management_years

      #risk management contact
      t.string :risk_management_contact
      t.string :phone_number
      t.string :email

      #life safety
      t.boolean :fire_alrams, default: false
      t.string  :alarm_locations
      t.boolean :hard_wired_smoke_detectors, default: false
      t.boolean :battery_operated_smoke_detectors, default: false
      t.string  :smoke_detector_locations
      t.boolean :emergency_lighting, default: false
      t.string  :lighting_locations
      t.boolean :sprinklers, default: false
      t.string  :sprinkler_locations
      t.boolean :exterior_evacuation_routes, default: false
      t.string  :evacuation_route_locations
      t.boolean :central_meeting_point, default: false
      t.string  :meeting_point_locations
      t.boolean :exit_signs,  default: false
      t.string  :exit_sign_locations
      t.string  :fire_drills
      t.boolean :two_exit_doors, default: false
      t.string  :exit_door_locations
      t.boolean :panic_exit_doors, default: false
      t.string  :panic_exit_door_locations
      t.boolean :smoking_permitted, default: false
      t.string  :somking_locations

      #automibile
      t.float   :percentage_of_employee
      t.float   :percentage_of_volunteer
      t.string  :vehicle_use
      t.boolean :require_employees_and_volunteers, default: false
      t.string  :required_limits
      t.boolean :use_mvr, default: false
      t.string  :how_often_use_mvr
      t.boolean :driver_safety_programm, default: false
      t.boolean :transport_clients, default: false
      t.boolean :new_employee_training, default: false
      t.boolean :transport_governmental_or_public_clients, default: false
      t.string  :explain_transportation
      t.boolean :transport_fee
      t.boolean :plug_in_gps_telematics
      t.boolean :hard_wired_gps_telematics
      t.boolean :mobile_phone_gps_telematics
      t.boolean :other_gps_telematics
      t.string  :telematic_device
      t.float   :fleet_telematics_percentage

      #general liablity
      t.string  :operation_narrative
      t.float   :annual_budget
      t.float   :annual_payroll
      t.integer :clients_per_year
      t.boolean :no_clients, default: false
      t.integer :number_of_students
      t.boolean :no_students, default: false
      t.integer :no_of_beds
      t.boolean :sheltered_workshops, default: false
      t.integer :shelter_location_no
      t.string  :workshop_function
      t.boolean :janitorial_services, default: false
      t.boolean :landscaping_services, default: false
      t.string  :other_mobile_work
      t.float   :janitorial_payroll
      t.float   :landscaping_payroll
      t.float   :other_payroll
      t.boolean :worker_compensation, default: false
      t.boolean :day_care_programm, default: false
      t.string  :location_number
      t.integer :no_of_children_supervised
      t.float   :children_to_staff_ratio
      t.integer :age_range
      t.boolean :foster_care, default: false
      t.string  :foster_care_explanation
      t.float   :total_operation_percentage
      t.boolean :leased_locations, default: false
      t.string  :leased_location_number
      t.float   :square_feet
      t.boolean :own_swimmin_pool, default: false
      t.string  :building_or_location
      t.boolean :spa_safety_act, default: false
      t.string  :time_table_or_action_plan
      t.boolean :lead_paint, default: false
      t.string  :abatement_plan
      t.boolean :sexual_offenders_therapy, default: false
      t.boolean :sexual_predators_therapy, default: false

      #professional liability
      t.boolean  :professional_liability_coverage, default: false
      t.boolean  :occurence, default: false
      t.boolean  :claims_made, default: false
      t.float    :professional_liablity_limits
      t.string   :professional_carrier
      t.datetime :effective_date
      t.integer  :full_time_employees
      t.integer  :part_time_employees
      t.integer  :volunteers

      #CONSULTANTS / INDEPENDENT CONTRACTORS
      t.boolean :dentist,            default: false
      t.boolean :nurse_practitioner, default: false
      t.boolean :optometrsit, default: false
      t.boolean :physicians, default: false
      t.boolean :psychiatrist, default: false
      t.boolean :other_contracted_services, default: false
      t.string  :other_services_details
      t.boolean :written_aggreements, default: false

      #ABUSE & MOLESTATION
      t.boolean  :abuse_or_molestation, default: false
      t.boolean  :abuse_occurence, default: false
      t.boolean  :claims_made_abuse, default: false
      t.float    :liability_limits_for_abuse
      t.string   :abuse_carrier
      t.datetime :abuse_effective_date
      t.boolean  :convicted_of_crime, default: false
      t.boolean  :crisis_plane, default: false
      t.boolean  :written_complaint_procedure, default: false
      t.string   :explain_complaint_preocedure
      t.boolean  :writtern_supervision_plan,    default: false
      t.boolean  :writtern_hiring_procedure,    default: false
      t.boolean  :volunteers_work_with_clients, default: false
      t.boolean  :formal_training, default: false
      t.string   :formal_training_occurence
      t.boolean  :closed_door_meeting,    default: false
      t.boolean  :patient_welfare,    default: false
      t.boolean  :case_settled,    default: false
      t.boolean  :case_trialled,    default: false
      t.string   :amount_paid
      t.boolean  :employee_criminal_background,    default: false
      t.boolean  :volunteer_criminal_background,    default: false

      #CLAIMS MADE
      t.datetime  :policy_effective_date
      t.string    :line_of_bussiness
      t.boolean   :writtern_notice, default: false
      t.string    :notice_explanation
      t.boolean   :claim_coverages, default: false
      t.string    :claim_coverage_explanation

      #WINTER WEATHER FREEZE-UP PROTECTION
      t.integer :fire_sprinkler
      t.float   :sprikled_percentage
      t.boolean :wet_pipe_sprinkle, default: false
      t.boolean :dry_pipe_sprinkle, default: false
      t.boolean :both_types,        default: false
      t.integer :sprikle_templerature
      t.string  :sprinkle_freeze_prevention
      t.integer :freeze_winterization_review
      t.integer :ul_monitering_company
      t.string  :freeze_prevention_measures
      t.integer :water_valves_accessible
      t.integer :valves_exercised_annualy
      t.integer :staff_qualified
      t.integer :automatic_shutoff
      t.integer :formal_process
      t.integer :water_lines_temperature
      t.string  :water_lines_freeze_prevention
      t.string  :general_comments


      #CYBER SECURITY LIABILITY ENDORSEMENT – SUPPLEMENTAL QUESTIONNAIRE
      t.string  :operation_nature
      t.boolean :collect_pii
      t.boolean :collect_ssn
      t.boolean :collect_phi
      t.boolean :collect_credit_card_info
      t.boolean :applicant_alleged, default: false
      t.boolean :lawsuit_faced, default: false
      t.boolean :subject_of_investigation, default: false
      t.boolean :applicant_circumstance, default: false

      t.timestamps
    end
  end
end
