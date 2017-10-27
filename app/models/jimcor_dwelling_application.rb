class JimcorDwellingApplication < ApplicationRecord
  has_many :jimcor_dwelling_mortgagees

  belongs_to :client
  belongs_to :agent

  APPLICATION_TITLE = "Jimcor Dwelling Insurance Application"
end
