class CreateJimcorDwellingInsuranceApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :jimcor_dwelling_insurance_applications do |t|
      t.references :agent, index: true
      t.references :client, index: true

      t.string  :applicant_name
      t.string  :applicant_address
      t.string  :applicant_phone_no
      t.string  :applicant_previous_carrier
      t.integer :policy_number
      t.string  :policy_period

      t.float   :peril_deductible
      t.float   :wind_hail_deductible
      t.float   :water_demage_deductible
      t.float   :personal_liability
      t.float   :mdeical_liability
      t.date    :proposed_start_date
      t.date    :proposed_end_date
      t.integer :public_protection_class
      t.string  :risk_location_address
      t.float   :dwelling_coverage
      t.boolean :personal_property,           default:  false
      t.float   :other_structures_coverage
      t.float   :rent_loss_coverage
      t.float   :dwelling_replacement_cost
      t.string  :replacement_cost_formula
      t.float   :market_value
      t.integer :built_year
      t.float   :square_feet
      t.integer :total_stories
      t.integer :total_families
      t.string  :fire_hydrant_distance
      t.string  :fire_station_distance
      t.boolean :frame_construction_category, default:  false
      t.boolean :joisted_masonry_category,    default:  false
      t.integer :electrics_update_year
      t.boolean :amps_rated,                  default:  false
      t.integer :heating_update_year
      t.boolean :electric_heating,            default:  false
      t.boolean :gas_heating,                 default:  false
      t.boolean :oil_heating,                 default:  false
      t.boolean :coal_heating,                default:  false
      t.boolean :other_heating,               default:  false
      t.boolean :wood_stove_aux_heating,      default:  false
      t.boolean :coal_stove_aux_heating,      default:  false
      t.boolean :pellet_stove_aux_heating,    default:  false
      t.boolean :kerosene_aux_heater,         default:  false
      t.boolean :aux_heating_unit_installed,  default:  false
      t.integer :roof_update_year
      t.boolean :entire_roof_updated,         default:  false
      t.integer :plumbing_update_year

      #general question fields
      t.boolean :banckrupt,                  default:  false
      t.string  :banckrupt_remarks
      t.boolean :foreclosured,               default:  false
      t.string  :foreclosured_remarks
      t.boolean :unemloyed,                  default:  false
      t.string  :unemployed_remarks
      t.boolean :canceled,                   default:  false
      t.string  :canceled_remarks
      t.boolean :lapsed,                     default:  false
      t.string  :lapsed_remarks

      #dwelling questioin fields
      t.boolean :owner_occupied,             default:  false
      t.string  :owner_occupied_remarks
      t.boolean :portion_unoccupied,         default:  false
      t.string  :portion_unoccupied_remarks
      t.boolean :under_renovation,           default:  false
      t.string  :under_renovation_remarks
      t.boolean :under_construction,         default:  false
      t.string  :under_construction_remarks
      t.boolean :business_conducted,         default:  false
      t.string  :business_conducted_remarks
      t.boolean :domestic_employees,         default:  false
      t.string  :domestic_employees_remarks
      t.boolean :horses_owned,               default:  false
      t.string  :horses_owned_remarks
      t.boolean :non_domestic_animals,       default:  false
      t.string  :non_domestic_animals_remarks
      t.boolean :domestic_animals,           default:  false
      t.string  :domestic_animals_remarks
      t.boolean :contiains_swimming_pool,    default:  false
      t.string  :swimming_pool_remarks
      t.boolean :contains_trampoline,        default:  false
      t.string  :trampoline_remarks
      t.boolean :contains_smoke_detectors,   default:  false
      t.string  :smoke_detector_remarks
      t.boolean :contains_exterior_steps,    default:  false
      t.string  :exterior_step_remarks
      t.boolean :secondary_residence,        default:  false
      t.string  :secondary_residence_remarks
      t.boolean :furthest_to_ocean,          default:  false
      t.string  :saltwater_bay_remarks
      t.boolean :nearby_ocean,               default:  false
      t.string  :nearby_ocean_remarks

      t.timestamps
    end
  end
end
