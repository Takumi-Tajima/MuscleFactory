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

ActiveRecord::Schema[8.0].define(version: 2025_06_01_141536) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "exercise_muscle_groups", force: :cascade do |t|
    t.bigint "training_exercise_id", null: false
    t.bigint "muscle_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_group_id"], name: "index_exercise_muscle_groups_on_muscle_group_id"
    t.index ["training_exercise_id", "muscle_group_id"], name: "idx_on_training_exercise_id_muscle_group_id_77cb346de0", unique: true
  end

  create_table "exercise_taggings", force: :cascade do |t|
    t.bigint "training_exercise_id", null: false
    t.bigint "exercise_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_tag_id"], name: "index_exercise_taggings_on_exercise_tag_id"
    t.index ["training_exercise_id", "exercise_tag_id"], name: "idx_on_training_exercise_id_exercise_tag_id_ca2c97d854", unique: true
  end

  create_table "exercise_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_exercise_tags_on_name", unique: true
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_muscle_groups_on_name", unique: true
  end

  create_table "training_exercises", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_training_exercises_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_schedule_exercises", force: :cascade do |t|
    t.bigint "workout_schedule_id", null: false
    t.bigint "training_exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_exercise_id"], name: "index_workout_schedule_exercises_on_training_exercise_id"
    t.index ["workout_schedule_id", "training_exercise_id"], name: "idx_on_workout_schedule_id_training_exercise_id_721579cbfe", unique: true
  end

  create_table "workout_schedules", force: :cascade do |t|
    t.datetime "scheduled_on", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workout_schedules_on_user_id"
  end

  add_foreign_key "exercise_muscle_groups", "muscle_groups"
  add_foreign_key "exercise_muscle_groups", "training_exercises"
  add_foreign_key "exercise_taggings", "exercise_tags"
  add_foreign_key "exercise_taggings", "training_exercises"
  add_foreign_key "workout_schedule_exercises", "training_exercises"
  add_foreign_key "workout_schedule_exercises", "workout_schedules"
  add_foreign_key "workout_schedules", "users"
end
