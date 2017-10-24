# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171023113559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "title", null: false
    t.integer "owner_id", null: false
    t.string "website"
    t.string "street"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_agencies_on_owner_id"
  end

  create_table "agent_wholesalers", force: :cascade do |t|
    t.bigint "agent_id"
    t.bigint "wholesaler_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_wholesalers_on_agent_id"
    t.index ["wholesaler_id"], name: "index_agent_wholesalers_on_wholesaler_id"
  end

  create_table "agents", force: :cascade do |t|
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["agency_id"], name: "index_agents_on_agency_id"
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["invitation_token"], name: "index_agents_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_agents_on_invitations_count"
    t.index ["invited_by_id"], name: "index_agents_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_agents_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "salespeople", force: :cascade do |t|
    t.bigint "wholesaler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_salespeople_on_email", unique: true
    t.index ["invitation_token"], name: "index_salespeople_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_salespeople_on_invitations_count"
    t.index ["invited_by_id"], name: "index_salespeople_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_salespeople_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_salespeople_on_reset_password_token", unique: true
    t.index ["wholesaler_id"], name: "index_salespeople_on_wholesaler_id"
  end

  create_table "wholesalers", force: :cascade do |t|
    t.string "title", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "logo"
    t.string "website"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "address_1"
    t.string "address_2"
    t.index ["owner_id"], name: "index_wholesalers_on_owner_id"
  end

  add_foreign_key "agencies", "agents", column: "owner_id", on_delete: :cascade
  add_foreign_key "agent_wholesalers", "agents"
  add_foreign_key "agent_wholesalers", "wholesalers"
  add_foreign_key "agents", "agencies", on_delete: :cascade
  add_foreign_key "salespeople", "wholesalers", on_delete: :cascade
  add_foreign_key "wholesalers", "salespeople", column: "owner_id", on_delete: :cascade
end
