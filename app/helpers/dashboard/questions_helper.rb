module Dashboard::QuestionsHelper

  def general_questions
    {
      banckrupt_remarks: "Any BANKRUPTCY in the past three (3) years?",
      unemployed_remarks: "Is the insured UNEMPLOYED?",
      canceled_remarks: "Has any company CANCELLED, NON-RENEWED or REFUSED COVERAGE to the applicant in the past three (3) years?",
      foreclosured_remarks: "Any FORECLOSURE or REPOSSESSION in the past three (3) years?",
      lapsed_remarks: "Has there been a LAPSE in coverage in the past three (3) years?",
    }
  end

  def dewlling_questions
    {
      owner_occupied_remarks: "Is this dwelling OWNER OCCUPIED?",
      portion_unoccupied_remarks: "Is any portion of the dwelling UNOCCUPIED?",
      under_renovation_remarks: "Is this dwelling under RENOVATION?",
      under_construction_remarks: "Is this dwelling under CONSTRUCTION?",
      business_conducted_remarks: "Any BUSINESS conducted on premises?",
      domestic_employees_remarks: "Any DOMESTIC EMPLOYEES?",
      horses_owned_remarks: "HORSES owned, boarded, or otherwise kept?",
      non_domestic_animals_remarks: "Any VICIOUS and/or NON-DOMESTIC ANIMALS?",
      domestic_animals_remarks: "Any DOMESTIC ANIMALS?",
      trampoline_remarks: "Is there a TRAMPOLINE on premises?",
      exterior_step_remarks: "Are there any EXTERIOR STEPS?",
      smoke_detector_remarks: "Is there an adequate number of SMOKE DETECTORS?",
      secondary_residence_remarks: "Is this a SECONDARY or SEASONAL residence?",
      saltwater_bay_remarks: "Is this dwelling within 2 MILES of the ocean or saltwater bay?",
      nearby_ocean_remarks: "Is this dwelling within 2,000 FEET of the ocean or saltwater bay?",
      swimming_pool_remarks: "Is there a SWIMMING POOL on premises?",
    }
  end
end
