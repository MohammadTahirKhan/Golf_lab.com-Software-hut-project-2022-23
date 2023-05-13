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

ActiveRecord::Schema[7.0].define(version: 2023_05_13_102610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data", force: :cascade do |t|
    t.string "xCoordinates"
    t.string "yCoordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "terrain_type"
    t.bigint "hole_id"
    t.bigint "user_hole_id"
    t.index ["hole_id"], name: "index_data_on_hole_id"
    t.index ["user_hole_id"], name: "index_data_on_user_hole_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "golf_clubs", force: :cascade do |t|
    t.string "name"
    t.string "manufacturer"
    t.string "club_type"
    t.bigint "user_hole_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_hole_id"], name: "index_golf_clubs_on_user_hole_id"
  end

  create_table "handicaps", force: :cascade do |t|
    t.integer "value"
    t.bigint "user_hole_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_hole_id"], name: "index_handicaps_on_user_hole_id"
  end

  create_table "holes", force: :cascade do |t|
    t.integer "hole_number"
    t.boolean "is_beingEdited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "course_name"
    t.index ["user_id"], name: "index_holes_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "user_holes", force: :cascade do |t|
    t.integer "hole_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hole_id"
    t.bigint "user_id"
    t.index ["hole_id"], name: "index_user_holes_on_hole_id"
    t.index ["user_id"], name: "index_user_holes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_role", default: 2
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "data", "holes"
  add_foreign_key "data", "user_holes"
  add_foreign_key "golf_clubs", "user_holes"
  add_foreign_key "handicaps", "user_holes"
  add_foreign_key "holes", "users"
  add_foreign_key "user_holes", "holes"
  add_foreign_key "user_holes", "users"
end
