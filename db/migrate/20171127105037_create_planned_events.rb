class CreatePlannedEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :planned_events do |t|
      t.references :human_service_application

      t.integer  :event_type
      t.datetime :event_date
      t.integer  :operation_hours
      t.float    :anticipated_revenue
      t.string   :location
      t.integer  :no_of_participants
      t.integer  :no_of_staff_members
      t.boolean  :obtained_certificates, default: false
      t.string   :drinking_control_explanation
      t.string   :alcohol_provider_explanation
      t.string   :bartenders_explanation
      t.string   :sport_activities
      t.string   :spectator_injury
      t.boolean  :signed_waiver, default: false
      t.string   :personal_health_proof
      t.boolean  :bartender_tips, defualt: false

      t.timestamps
    end
  end
end
