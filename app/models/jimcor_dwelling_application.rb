class JimcorDwellingApplication < ApplicationRecord
  has_many :jimcor_dwelling_mortgagees
  has_many :applications, as: :client_application

  belongs_to :client
  belongs_to :agent

  APPLICATION_TITLE = "Jimcor Dwelling Insurance Application"
end
