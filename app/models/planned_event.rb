class PlannedEvent < ApplicationRecord
  belongs_to :human_service_application

  enum event_type: {
    wine_tasting:         1,
    golf_outing:          2,
    other_sporting_event: 3,
    picnic:               4,
    Banquet:              5,
    house_tour:           6,
    bingo:                7,
    walkathon:            8,
    fashion_show:         9,
    concert:              10,
    other:                11,
  }
end
