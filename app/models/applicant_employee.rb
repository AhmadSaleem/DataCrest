class ApplicantEmployee < ApplicationRecord
  belongs_to :human_service_application

  enum profession: {
    counselors:              1,
    psychiatrists:           2,
    social_workers:          3,
    physicians_hospice:      4,
    occupational_therapists: 5,
    pediatricians:           6,
    speech_therapists:       7,
    physicians:              8,
    teachers:                9,
    dentists:                10,
    nutritionists:           11,
    opticians:               12,
    resident_managers:       13,
    psychologists:           14,
    home_health_aides:       15,
    medical_directors:       16,
    licensed_social_workers: 17,
    nurse_Practitioners:     18,
    sociologists:            19,
    physicians_assistants:   20,
    rns:                     21,
    pharmacists:             22,
    lpns:                    23,
    paramedics_emts:         24,
    physical_therapists:     25,
    others:                  26,
  }

  enum employee_type: {
    full_time_employee:   1,
    part_time_employee:   2,
    full_time_contracted: 3,
    part_time_contracted: 4,
    volunteer:            5,
  }

end
