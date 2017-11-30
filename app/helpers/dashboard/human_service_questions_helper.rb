module Dashboard::HumanServiceQuestionsHelper
  def life_safety
    {
      exterior_evacuation_routes: "Are evacuation routes posted throughout the building?",
      central_meeting_point: "In the event of an evacuation, have the Applicant established a central meeting point outside the building?",
      exit_signs: "Are exit signs illuminated?",
      fire_drills: "How often are fire drills held?",
      two_exit_doors:   "Are there at least two exit doors per building?",
      panic_exit_doors: "Are exit doors equipped with panic hardware?",
      smoking_permitted: "Is smoking permitted inside the premises?",
    }
  end

  def automobile
    {
      require_employees_and_volunteers: "Does the Applicant require employees and volunteers to carry and show evidence of personal insurance?",
      required_limits: "What limits are required?",
      use_mvr: "Does the Applicant run MVRs on employees?",
      driver_safety_program: "Does the Applicant have a driver safety training program?",
      transport_clients:  "Does the Applicant’s Agency transport clients?",
      new_employee_training: "Is training provided for new employees prior to their transporting clients?",
      transport_governmental_or_public_clients: "Does the Applicant’s agency transport clients/consumers for other private or governmental agencies?",
      utilize_gps_fleets: "Does the Applicant’s organization utilize GPS fleet telematics devices?",
      fleet_telematics_percentage: "What percentage of the Applicant’s fleet is provided with these fleet telematics devices?",
      vehicle_use: "What percentages of employees/volunteers use their own vehicles regularly (daily/weekly) for agency business?",
    }
  end

  def general_liability
    { 
      operation_narrative: "Please provide a narrative of the Applicant’s operations:",
      clients_per_year: "Number of clients/customers per year:",
      no_of_beds:   "If providing residential services, provide number of beds at each location:",
      sheltered_workshops: "Does the Applicant have sheltered workshops?",
      shelter_location_no: "Indicate location number:",
      workshop_function: "Describe the work being performed:",
      janitorial_services: "Does the Applicant have mobile work forces, janitorial services?",
      worker_compensation: "Is Workers Compensation carried for clients?",
      day_care_programe: "Does the Applicant have a day care program?",
      foster_care:  "Does the Applicant provide any foster care or adoption services?",
      foster_care_explanation: "If yes, please explain and indicate # of placements for each:",
      total_operation_percentage: "What percentage of total operations does this represent?",
      leased_locations: "Are any locations leased to others?",
      own_swimming_pool: "Does the Applicant have any swimming pools?",
      building_or_location: "Indicate Building or location number:",
      diving_board: "Diving Board/Slide?",
      spa_safety_act: "Are all Swimming Pools / Spas compliant with the Virginia Graeme Baker Pool and Spa Safety Act?",
      time_table_or_action_plan: "If no, provide time table and action plan:",
      lead_paint: "Have all buildings built prior to 1971 been inspected for lead paint?",
      abatement_plan: "If no, what is the plan for abatement:",
      target_classes: "Are counseling services/therapy offered for the following target classes:",
    }
  end

  def professional_liability_coverage
    {
      professional_liability_coverage: "Does the Applicant’s current insurance program provide Professional Liability coverage?",
      malpractice_insurance: "Do the physicians carry their own malpractice insurance?",
      accredited: "Has the Applicant’s operations/facilities ever been accredited / certified by CARF, JCAHO, ECFA,
                   COA, ACHC or similar organization created to serve the Human/Behavioral /HealthCare Services Industry?",
      accrediting_organization: "Name of Accrediting Organization:",
    }
  end

  def independent_contractors
    {
      contracted_service: "Please indicate which of the following contracted service providers are utilized:",
      written_agreements: "Are there written agreements with independent contractors?",
    }
  end

  def abuse_or_molestation
    {
      abuse_or_molestation: "Does the Applicant’s current insurance program include Abuse and Molestation Coverage?",
      convicted_of_crime:  "Does the Applicant’s employment process include verification of whether the individual has ever been convicted
                            of any crime, including sex related or child-abuse related offenses, before an offer of employment is made?",
      crisis_plan: "Does the Applicant have a written crisis plan in place for dealing with employees, victims, parents,
                    authorities, and the media if the Applicant has incident of abuse?",
      written_complaint_procedure: "Are there written complaint procedures and are they displayed prominently?",
      written_supervision_plan: "Is there a written supervision plan that monitors staff in day-to-day relationships with clients, both on and off premises?",
      written_hiring_procedure: "Are formal written procedures in place for hiring?",
      volunteers_work_with_clients: "Do volunteers work directly with clients?",
      formal_training: "Is there formal staff training for volunteers and staff on child/sexual abuse, including how to recognize the signs?",
      client_staff_relation: "What procedures are in place to make sure no relationship occurs between staff and clients?",
      closed_door_meeting: "Are there procedures prohibiting closed door one-on-one meetings / counseling?",
      patient_welfare: "Is there more than one person responsible for the welfare of any single patient?",
      sexual_abuse_incident: "Have any incidents resulted in an allegation of sexual abuse?",
      case_settled: "Was the case settled?",
      case_trialled: "Was the case taken to trial?",
      amount_paid: "Amount paid for damages to the victim:",
      employee_criminal_background: "Does the Applicant run criminal background checks on employees?",
      volunteer_criminal_background: "Does the Applicant run criminal background checks on volunteers?",
    }
  end

  def claims_made
    {
      written_notice: "Within the past 5 (five) years has the Applicant given written notice under the provisions of any
                      current or prior policy providing similar insurance of any claim or of any specific facts or
                      circumstances which might give rise to a claim being made against the Applicant?",
      notice_explanation: "If yes, please provide details:",
      claim_coverages: "With respect to the coverages applied for, upon inquiry of any of person qualifying as a Named
                        Insured under the proposed policy, are there any facts, circumstances, or situations which might
                        give rise to a claim under the coverage(s) for which the Applicant is applying?",
      claim_coverage_explanation: "If yes, please provide details:",
    }
  end

  def planned_events
    { 
      event_type: "Describe the type of event",
      event_date: "Date(s) the event is held.",
      operation_hours: "Daily hours of operation.",
      anticipated_revenue: "Total anticipated revenue.",
      location: "Held at Applicant’s premises? If not, specify where it is held.",
      obtained_certificates: "Are certificates of insurance obtained from everyone providing products / services?",
      drinking_control_explanation: "If there will be drinking at the event, how does the Applicant control the amount allowed?",
      alcohol_provider_explanation: "Who provides / serves the alcohol? Liquor license required?",
      bartenders_explanation: "Are the bartenders hired by the Applicant or by the place where the event is held?",
      sport_activities: "If applicable, list all sporting activities to be a part of this event.",
      spectator_injury: "What safeguards are in place to prevent spectator injury?",
      signed_waiver: "Do participants sign a waiver?",
      personal_health_proof: "Do participants show proof of personal health insurance?",
      bartender_tips: "Do the bartenders know TIPPS?",
    }
  end

  def weather_protection
    {
      fire_sprinkler: "Is the building provided with an Automatic Fire Sprinkler System (AS)?",
      sprinkled_percentage: "If yes, approximately what percentage (%) of the building is sprinklered?",
      wet_pipe_sprinkler: "If yes, what type of sprinkler system is installed?",
      sprinkler_temperature: "If yes, when possible, is the sprinkler piping primarily run within conditioned areas designed to ensure the
                              temperature remains above the 45°F minimum temperature?",
      sprinkler_freeze_prevention: "If no, please describe freeze prevention measures (e.g. temperature monitoring, heat trace, full
                                    insulation on piping or roof):",
      freeze_winterization_review: "If yes, is the testing & inspection by qualified sprinkler contractor completed within past 12
                                    months & includes a formal winterization review?",
      ul_monitoring_company: "If yes, are the alarms tied to a 24 hour UL listed monitoring company?",
      water_valves_accessible: "Are water shutoff valves (domestic and AS water lines) marked and readily accessible?",
      valves_exercised_annualy: "Are water shutoff valves exercised (closed and reopened) at least annually?",
      staff_qualified: "Is the staff qualified to respond and shut off the water main during normal business hours and off hours?",
      automatic_shutoff: "For domestic water lines, is there a water flow detection, notification and automatic shutoff?",
      formal_process: "Does Applicant have a formal process to turn off and drain domestic water lines for these spaces?",
      water_lines_temperature: "Are all domestic water lines located in areas heated to at least 45°F?",
      water_lines_freeze_prevention: "If no, please describe freeze prevention measures (temperature monitoring, heat trace, full insulation):",
      emergency_water: "Emergency Water Response (domestic and AS water lines)",
      automatic_water: "Automatic Water Shutoff Devices",
      unsued: "Unused/Vacant Spaces",
      unheated_areas: "Unheated Areas (attics, crawl spaces, exterior wall joists)",
    }
  end

  def cyber_security
    {
      collect_pii: "Does the Applicant collect, store or otherwise handle any Personally Identifiable Information (PII) belonging to customers,
                    clients, or other third parties, other than employees?",
      collect_ssn: "Social Security Numbers, Bank or Other Financial Account Details, Driver’s License or otherState Identification Numbers",
      collect_phi: "Non-Public Medical or Healthcare Data, including Protected Health Information (PHI)",
      collect_credit_card_info: "Credit or Debit Card Information",
      applicant_alleged: "During the last three (3) years, has anyone alleged that the Applicant was responsible for damage to their
                          computer system(s) arising out of the operation of the Applicant’s computer system(s)?",
      lawsuit_faced: "During the last three (3) years, has anyone made a demand, claim, complaint, or filed a lawsuit against the Applicant
                      alleging invasion or interference of rights of privacy or the inappropriate disclosure of Personally Identifiable
                      Information (PII)?",
      subject_of_investigation: "During the last three (3) years, has the Applicant been the subject of an investigation or action by any
                                 regulatory or administrative agency for privacy-related violations?",
      applicant_circumstance: "Is the Applicant aware of any circumstance that could reasonably be anticipated to result in a claim being
                               made against them for the coverage being applied for?",
      applicable: "If yes, please indicate the types of Personally Identifiable Information held. (check all that apply):",
    }
  end

  def title
    {
      cyber_security: "CYBER SECURITY LIABILITY ENDORSEMENT – SUPPLEMENTAL QUESTIONNAIRE (FOR LIMITS $250,000 OR LESS)",
    }
  end

end