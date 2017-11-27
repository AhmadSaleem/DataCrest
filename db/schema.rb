# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171127110953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "title"
    t.integer "owner_id", null: false
    t.string "website"
    t.string "address_1"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "logo"
    t.string "address_2"
    t.string "agency_code"
    t.index ["owner_id"], name: "index_agencies_on_owner_id"
  end

  create_table "agency_applications", force: :cascade do |t|
    t.bigint "agency_id"
    t.bigint "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "template_id"
    t.index ["agency_id"], name: "index_agency_applications_on_agency_id"
    t.index ["agent_id"], name: "index_agency_applications_on_agent_id"
    t.index ["template_id"], name: "index_agency_applications_on_template_id"
  end

  create_table "agent_wholesalers", force: :cascade do |t|
    t.bigint "agent_id"
    t.bigint "wholesaler_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_wholesalers_on_agent_id"
    t.index ["wholesaler_id"], name: "index_agent_wholesalers_on_wholesaler_id"
  end

  create_table "agents", force: :cascade do |t|
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "applications_count", default: 0
    t.string "agent_code"
    t.json "profile_picture"
    t.index ["agency_id"], name: "index_agents_on_agency_id"
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["invitation_token"], name: "index_agents_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_agents_on_invitations_count"
    t.index ["invited_by_id"], name: "index_agents_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_agents_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "applicant_employees", force: :cascade do |t|
    t.bigint "human_service_applications_id"
    t.integer "profession"
    t.integer "employee_type"
    t.string "others_description"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["human_service_applications_id"], name: "index_applicant_employees_on_human_service_applications_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.json "profile_picture"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["invitation_token"], name: "index_clients_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_clients_on_invitations_count"
    t.index ["invited_by_id"], name: "index_clients_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_clients_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "human_service_applications", force: :cascade do |t|
    t.string "applicant_name"
    t.string "mailing_address"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.integer "full_time_staff"
    t.integer "part_time_staff"
    t.integer "sic_number"
    t.integer "fein_number"
    t.string "website"
    t.boolean "non_profit", default: false
    t.boolean "for_profit", default: false
    t.float "annual_revenue"
    t.integer "operational_years"
    t.integer "current_management_years"
    t.string "risk_management_contact"
    t.string "phone_number"
    t.string "email"
    t.boolean "fire_alrams", default: false
    t.string "alarm_locations"
    t.boolean "hard_wired_smoke_detectors", default: false
    t.boolean "battery_operated_smoke_detectors", default: false
    t.string "smoke_detector_locations"
    t.boolean "emergency_lighting", default: false
    t.string "lighting_locations"
    t.boolean "sprinklers", default: false
    t.string "sprinkler_locations"
    t.boolean "exterior_evacuation_routes", default: false
    t.string "evacuation_route_locations"
    t.boolean "central_meeting_point", default: false
    t.string "meeting_point_locations"
    t.boolean "exit_signs", default: false
    t.string "exit_sign_locations"
    t.string "fire_drills"
    t.boolean "two_exit_doors", default: false
    t.string "exit_door_locations"
    t.boolean "panic_exit_doors", default: false
    t.string "panic_exit_door_locations"
    t.boolean "smoking_permitted", default: false
    t.string "somking_locations"
    t.float "percentage_of_employee"
    t.float "percentage_of_volunteer"
    t.string "vehicle_use"
    t.boolean "require_employees_and_volunteers", default: false
    t.string "required_limits"
    t.boolean "use_mvr", default: false
    t.string "how_often_use_mvr"
    t.boolean "driver_safety_programm", default: false
    t.boolean "transport_clients", default: false
    t.boolean "new_employee_training", default: false
    t.boolean "transport_governmental_or_public_clients", default: false
    t.string "explain_transportation"
    t.boolean "transport_fee"
    t.boolean "plug_in_gps_telematics"
    t.boolean "hard_wired_gps_telematics"
    t.boolean "mobile_phone_gps_telematics"
    t.boolean "other_gps_telematics"
    t.string "telematic_device"
    t.float "fleet_telematics_percentage"
    t.string "operation_narrative"
    t.float "annual_budget"
    t.float "annual_payroll"
    t.integer "clients_per_year"
    t.boolean "no_clients", default: false
    t.integer "number_of_students"
    t.boolean "no_students", default: false
    t.integer "no_of_beds"
    t.boolean "sheltered_workshops", default: false
    t.integer "shelter_location_no"
    t.string "workshop_function"
    t.boolean "janitorial_services", default: false
    t.boolean "landscaping_services", default: false
    t.string "other_mobile_work"
    t.float "janitorial_payroll"
    t.float "landscaping_payroll"
    t.float "other_payroll"
    t.boolean "worker_compensation", default: false
    t.boolean "day_care_programm", default: false
    t.string "location_number"
    t.integer "no_of_children_supervised"
    t.float "children_to_staff_ratio"
    t.integer "age_range"
    t.boolean "foster_care", default: false
    t.string "foster_care_explanation"
    t.float "total_operation_percentage"
    t.boolean "leased_locations", default: false
    t.string "leased_location_number"
    t.float "square_feet"
    t.boolean "own_swimmin_pool", default: false
    t.string "building_or_location"
    t.boolean "spa_safety_act", default: false
    t.string "time_table_or_action_plan"
    t.boolean "lead_paint", default: false
    t.string "abatement_plan"
    t.boolean "sexual_offenders_therapy", default: false
    t.boolean "sexual_predators_therapy", default: false
    t.boolean "professional_liability_coverage", default: false
    t.boolean "occurence", default: false
    t.boolean "claims_made", default: false
    t.float "professional_liablity_limits"
    t.string "professional_carrier"
    t.datetime "effective_date"
    t.integer "full_time_employees"
    t.integer "part_time_employees"
    t.integer "volunteers"
    t.boolean "dentist", default: false
    t.boolean "nurse_practitioner", default: false
    t.boolean "optometrsit", default: false
    t.boolean "physicians", default: false
    t.boolean "psychiatrist", default: false
    t.boolean "other_contracted_services", default: false
    t.string "other_services_details"
    t.boolean "written_aggreements", default: false
    t.boolean "abuse_or_molestation", default: false
    t.boolean "abuse_occurence", default: false
    t.boolean "claims_made_abuse", default: false
    t.float "liability_limits_for_abuse"
    t.string "abuse_carrier"
    t.datetime "abuse_effective_date"
    t.boolean "convicted_of_crime", default: false
    t.boolean "crisis_plane", default: false
    t.boolean "written_complaint_procedure", default: false
    t.string "explain_complaint_preocedure"
    t.boolean "writtern_supervision_plan", default: false
    t.boolean "writtern_hiring_procedure", default: false
    t.boolean "volunteers_work_with_clients", default: false
    t.boolean "formal_training", default: false
    t.string "formal_training_occurence"
    t.boolean "closed_door_meeting", default: false
    t.boolean "patient_welfare", default: false
    t.boolean "case_settled", default: false
    t.boolean "case_trialled", default: false
    t.string "amount_paid"
    t.boolean "employee_criminal_background", default: false
    t.boolean "volunteer_criminal_background", default: false
    t.datetime "policy_effective_date"
    t.string "line_of_bussiness"
    t.boolean "writtern_notice", default: false
    t.string "notice_explanation"
    t.boolean "claim_coverages", default: false
    t.string "claim_coverage_explanation"
    t.integer "fire_sprinkler"
    t.float "sprikled_percentage"
    t.boolean "wet_pipe_sprinkle", default: false
    t.boolean "dry_pipe_sprinkle", default: false
    t.boolean "both_types", default: false
    t.integer "sprikle_templerature"
    t.string "sprinkle_freeze_prevention"
    t.integer "freeze_winterization_review"
    t.integer "ul_monitering_company"
    t.string "freeze_prevention_measures"
    t.integer "water_valves_accessible"
    t.integer "valves_exercised_annualy"
    t.integer "staff_qualified"
    t.integer "automatic_shutoff"
    t.integer "formal_process"
    t.integer "water_lines_temperature"
    t.string "water_lines_freeze_prevention"
    t.string "general_comments"
    t.string "operation_nature"
    t.boolean "collect_pii"
    t.boolean "collect_ssn"
    t.boolean "collect_phi"
    t.boolean "collect_credit_card_info"
    t.boolean "applicant_alleged", default: false
    t.boolean "lawsuit_faced", default: false
    t.boolean "subject_of_investigation", default: false
    t.boolean "applicant_circumstance", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurance_applications", force: :cascade do |t|
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_application_id"
    t.string "client_application_type"
    t.integer "status", default: 0
    t.index ["template_id"], name: "index_insurance_applications_on_template_id"
  end

  create_table "jimcor_dwelling_applications", force: :cascade do |t|
    t.bigint "agent_id"
    t.bigint "client_id"
    t.string "applicant_name"
    t.string "applicant_address"
    t.string "applicant_phone_no"
    t.string "applicant_previous_carrier"
    t.integer "policy_number"
    t.string "policy_period"
    t.float "peril_deductible"
    t.float "wind_hail_deductible"
    t.float "water_demage_deductible"
    t.float "personal_liability"
    t.float "mdeical_liability"
    t.date "proposed_start_date"
    t.date "proposed_end_date"
    t.integer "public_protection_class"
    t.string "risk_location_address"
    t.float "dwelling_coverage"
    t.boolean "personal_property", default: false
    t.float "other_structures_coverage"
    t.float "rent_loss_coverage"
    t.float "dwelling_replacement_cost"
    t.string "replacement_cost_formula"
    t.float "market_value"
    t.integer "built_year"
    t.float "square_feet"
    t.integer "total_stories"
    t.integer "total_families"
    t.string "fire_hydrant_distance"
    t.string "fire_station_distance"
    t.boolean "frame_construction_category", default: false
    t.boolean "joisted_masonry_category", default: false
    t.integer "electrics_update_year"
    t.boolean "amps_rated", default: false
    t.integer "heating_update_year"
    t.boolean "electric_heating", default: false
    t.boolean "gas_heating", default: false
    t.boolean "oil_heating", default: false
    t.boolean "coal_heating", default: false
    t.boolean "other_heating", default: false
    t.boolean "wood_stove_aux_heating", default: false
    t.boolean "coal_stove_aux_heating", default: false
    t.boolean "pellet_stove_aux_heating", default: false
    t.boolean "kerosene_aux_heater", default: false
    t.boolean "aux_heating_unit_installed", default: false
    t.integer "roof_update_year"
    t.boolean "entire_roof_updated", default: false
    t.integer "plumbing_update_year"
    t.boolean "banckrupt", default: false
    t.string "banckrupt_remarks"
    t.boolean "foreclosured", default: false
    t.string "foreclosured_remarks"
    t.boolean "unemloyed", default: false
    t.string "unemployed_remarks"
    t.boolean "canceled", default: false
    t.string "canceled_remarks"
    t.boolean "lapsed", default: false
    t.string "lapsed_remarks"
    t.boolean "owner_occupied", default: false
    t.string "owner_occupied_remarks"
    t.boolean "portion_unoccupied", default: false
    t.string "portion_unoccupied_remarks"
    t.boolean "under_renovation", default: false
    t.string "under_renovation_remarks"
    t.boolean "under_construction", default: false
    t.string "under_construction_remarks"
    t.boolean "business_conducted", default: false
    t.string "business_conducted_remarks"
    t.boolean "domestic_employees", default: false
    t.string "domestic_employees_remarks"
    t.boolean "horses_owned", default: false
    t.string "horses_owned_remarks"
    t.boolean "non_domestic_animals", default: false
    t.string "non_domestic_animals_remarks"
    t.boolean "domestic_animals", default: false
    t.string "domestic_animals_remarks"
    t.boolean "contiains_swimming_pool", default: false
    t.string "swimming_pool_remarks"
    t.boolean "contains_trampoline", default: false
    t.string "trampoline_remarks"
    t.boolean "contains_smoke_detectors", default: false
    t.string "smoke_detector_remarks"
    t.boolean "contains_exterior_steps", default: false
    t.string "exterior_step_remarks"
    t.boolean "secondary_residence", default: false
    t.string "secondary_residence_remarks"
    t.boolean "furthest_to_ocean", default: false
    t.string "saltwater_bay_remarks"
    t.boolean "nearby_ocean", default: false
    t.string "nearby_ocean_remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage_of_completion", default: 0
    t.integer "mortgage_loan_number"
    t.string "mortgage_address"
    t.string "mortgage_name"
    t.boolean "mortgage_lending_organization", default: false
    t.integer "mortgage_2_loan_number"
    t.string "mortgage_2_address"
    t.string "mortgage_2_name"
    t.boolean "mortgage_2_lending_organization", default: false
    t.index ["agent_id"], name: "index_jimcor_dwelling_applications_on_agent_id"
    t.index ["client_id"], name: "index_jimcor_dwelling_applications_on_client_id"
  end

  create_table "jimcor_dwelling_mortgagees", force: :cascade do |t|
    t.bigint "jimcor_dwelling_application_id"
    t.integer "loan_number"
    t.string "name"
    t.string "address"
    t.boolean "lending_organization", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jimcor_dwelling_application_id"], name: "jimcor_dwelling_application_id"
  end

  create_table "planned_events", force: :cascade do |t|
    t.bigint "human_service_applications_id"
    t.integer "event_type"
    t.datetime "evnet_date"
    t.integer "operation_hours"
    t.float "anticpated_revenue"
    t.string "held_location"
    t.integer "no_of_participants"
    t.integer "on_of_staff_members"
    t.boolean "obtained_certificates", default: false
    t.string "drinking_control_exlaination"
    t.string "alcohol_provider_explanation"
    t.string "bartenders_explanation"
    t.string "sport_activities"
    t.string "spectator_injury"
    t.boolean "signed_waver", default: false
    t.string "personal_health_proof"
    t.boolean "bartender_tips"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["human_service_applications_id"], name: "index_planned_events_on_human_service_applications_id"
  end

  create_table "salespeople", force: :cascade do |t|
    t.bigint "wholesaler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.json "profile_picture"
    t.index ["email"], name: "index_salespeople_on_email", unique: true
    t.index ["invitation_token"], name: "index_salespeople_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_salespeople_on_invitations_count"
    t.index ["invited_by_id"], name: "index_salespeople_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_salespeople_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_salespeople_on_reset_password_token", unique: true
    t.index ["wholesaler_id"], name: "index_salespeople_on_wholesaler_id"
  end

  create_table "templates", force: :cascade do |t|
    t.bigint "wholesaler_id"
    t.string "class_name", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wholesaler_id"], name: "index_templates_on_wholesaler_id"
  end

  create_table "wholesalers", force: :cascade do |t|
    t.string "title", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "logo"
    t.string "website"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "address_1"
    t.string "address_2"
    t.index ["owner_id"], name: "index_wholesalers_on_owner_id"
  end

  add_foreign_key "agencies", "agents", column: "owner_id", on_delete: :cascade
  add_foreign_key "agent_wholesalers", "agents"
  add_foreign_key "agent_wholesalers", "wholesalers"
  add_foreign_key "agents", "agencies", on_delete: :cascade
  add_foreign_key "applicant_employees", "human_service_applications", column: "human_service_applications_id"
  add_foreign_key "planned_events", "human_service_applications", column: "human_service_applications_id"
  add_foreign_key "salespeople", "wholesalers", on_delete: :cascade
  add_foreign_key "wholesalers", "salespeople", column: "owner_id", on_delete: :cascade
end
