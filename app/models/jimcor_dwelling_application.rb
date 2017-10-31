class JimcorDwellingApplication < ApplicationRecord
  belongs_to :client
  belongs_to :agent

  delegate :full_name, to: :agent, prefix: true

  after_update :calculate_completion_percentage

  APPLICATION_TITLE = "Jimcor Dwelling Insurance Application"

  def status
    percentage_of_completion == 100 ? 'complete' : "#{percentage_of_completion}% complete"
  end

  private

    def calculate_completion_percentage
      completion_percentage = (self.attributes.select{|k, v| v.present?}.size / self.attributes.size.to_f) * 100
      self.update_column(:percentage_of_completion, completion_percentage.to_i)
    end
end
