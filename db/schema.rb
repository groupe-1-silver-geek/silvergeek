# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_11_162456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.text "description"
    t.integer "duration"
    t.bigint "game_id", null: false
    t.bigint "device_id", null: false
    t.string "otherDevice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "animator"
    t.bigint "structure_id", null: false
    t.string "suggestion"
    t.index ["device_id"], name: "index_activities_on_device_id"
    t.index ["game_id"], name: "index_activities_on_game_id"
    t.index ["structure_id"], name: "index_activities_on_structure_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "senior_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "degree", default: 0
    t.index ["activity_id"], name: "index_participations_on_activity_id"
    t.index ["senior_id"], name: "index_participations_on_senior_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seniors", force: :cascade do |t|
    t.string "pseudo"
    t.integer "age"
    t.string "gender"
    t.integer "code"
    t.bigint "structure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structure_id"], name: "index_seniors_on_structure_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "adress"
    t.integer "zipCode"
    t.string "city"
    t.bigint "partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.string "name"
    t.index ["partner_id"], name: "index_structures_on_partner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.bigint "partner_id"
    t.boolean "isValidated", default: false
    t.boolean "partner_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["partner_id"], name: "index_users_on_partner_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "devices"
  add_foreign_key "activities", "games"
  add_foreign_key "activities", "structures"
  add_foreign_key "participations", "activities"
  add_foreign_key "participations", "seniors"
  add_foreign_key "seniors", "structures"
  add_foreign_key "structures", "partners"
  add_foreign_key "users", "partners"
end
