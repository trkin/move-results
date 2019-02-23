# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_24_065641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "name", default: {}
    t.jsonb "description", default: {}
    t.string "icon_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_associations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "activity_id", null: false
    t.uuid "associated_activity_id", null: false
    t.integer "category", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_associations_on_activity_id"
    t.index ["associated_activity_id"], name: "index_activity_associations_on_associated_activity_id"
  end

  create_table "check_points", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "discipline_id", null: false
    t.integer "distance_m"
    t.integer "position", default: 0, null: false
    t.boolean "final", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_check_points_on_discipline_id"
  end

  create_table "club_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.uuid "user_id", null: false
    t.integer "status", default: 0, null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id", "user_id"], name: "index_club_users_on_club_id_and_user_id", unique: true
    t.index ["club_id"], name: "index_club_users_on_club_id"
    t.index ["user_id"], name: "index_club_users_on_user_id"
  end

  create_table "clubs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "name", default: {}
    t.uuid "venue_id"
    t.string "website"
    t.string "email"
    t.string "phone"
    t.boolean "personal", default: false, null: false
    t.string "national_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_clubs_on_venue_id"
  end

  create_table "crews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "race_id", null: false
    t.integer "lane"
    t.integer "relay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_crews_on_race_id"
  end

  create_table "disciplines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "activity_id", null: false
    t.uuid "event_id", null: false
    t.jsonb "name", default: {}
    t.integer "distance_m"
    t.integer "age_min"
    t.integer "age_max"
    t.integer "number_of_crew", default: 1, null: false
    t.integer "number_of_relays", default: 1, null: false
    t.integer "gender", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_disciplines_on_activity_id"
    t.index ["event_id"], name: "index_disciplines_on_event_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.uuid "venue_id"
    t.jsonb "name", default: {}
    t.date "start_date"
    t.date "end_date"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_events_on_club_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "member_crews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "member_id", null: false
    t.uuid "crew_id", null: false
    t.integer "position", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crew_id"], name: "index_member_crews_on_crew_id"
    t.index ["member_id"], name: "index_member_crews_on_member_id"
  end

  create_table "members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.uuid "person_id", null: false
    t.datetime "started_at"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_members_on_club_id"
    t.index ["person_id"], name: "index_members_on_person_id"
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "name", default: {}
    t.integer "birth_year"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "discipline_id", null: false
    t.integer "category", default: 0, null: false
    t.datetime "started_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_races_on_discipline_id"
  end

  create_table "results", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "crew_id", null: false
    t.uuid "check_point_id", null: false
    t.float "time_s"
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_point_id"], name: "index_results_on_check_point_id"
    t.index ["crew_id"], name: "index_results_on_crew_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "locale", default: "", null: false
    t.boolean "superadmin", default: false, null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "venues", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "name", default: {}
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activity_associations", "activities"
  add_foreign_key "activity_associations", "activities", column: "associated_activity_id"
  add_foreign_key "check_points", "disciplines"
  add_foreign_key "club_users", "clubs"
  add_foreign_key "club_users", "users"
  add_foreign_key "clubs", "venues"
  add_foreign_key "crews", "races"
  add_foreign_key "disciplines", "activities"
  add_foreign_key "disciplines", "events"
  add_foreign_key "events", "clubs"
  add_foreign_key "events", "venues"
  add_foreign_key "member_crews", "crews"
  add_foreign_key "member_crews", "members"
  add_foreign_key "members", "clubs"
  add_foreign_key "members", "people"
  add_foreign_key "races", "disciplines"
  add_foreign_key "results", "check_points"
  add_foreign_key "results", "crews"
end
