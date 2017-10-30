class JimcorDwellingApplication < ApplicationRecord
  has_many :jimcor_dwelling_mortgagees

  belongs_to :client
  belongs_to :agent

  delegate :full_name, to: :agent, prefix: true

  APPLICATION_TITLE = "Jimcor Dwelling Insurance Application"

  def status
    percentage_of_completion == 100 ? 'complete' : "#{percentage_of_completion}% complete"
  end
end
