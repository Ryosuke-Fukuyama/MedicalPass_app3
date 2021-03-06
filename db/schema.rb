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

ActiveRecord::Schema.define(version: 2021_08_16_113108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_hospitals", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guide_labels", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "health_interview_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "staff_id"
    t.index ["health_interview_id"], name: "index_guide_labels_on_health_interview_id"
    t.index ["staff_id"], name: "index_guide_labels_on_staff_id"
  end

  create_table "health_interviews", force: :cascade do |t|
    t.integer "age"
    t.integer "gender"
    t.text "symptomatology"
    t.text "condition"
    t.text "comment"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.bigint "hospital_id"
    t.boolean "notification", default: false
    t.index ["hospital_id"], name: "index_health_interviews_on_hospital_id"
    t.index ["patient_id"], name: "index_health_interviews_on_patient_id"
  end

  create_table "hospital_labelings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id"
    t.bigint "hospital_label_id"
    t.index ["hospital_id"], name: "index_hospital_labelings_on_hospital_id"
    t.index ["hospital_label_id"], name: "index_hospital_labelings_on_hospital_label_id"
  end

  create_table "hospital_labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "tel", null: false
    t.string "address", null: false
    t.string "access", null: false
    t.text "image"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "tel"
    t.string "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_patients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["name"], name: "index_patients_on_name"
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_patients_on_unlock_token", unique: true
  end

  create_table "sns_credentials", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_sns_credentials_on_patient_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id"
    t.index ["hospital_id"], name: "index_staffs_on_hospital_id"
    t.index ["name"], name: "index_staffs_on_name", unique: true
  end

  add_foreign_key "guide_labels", "health_interviews"
  add_foreign_key "guide_labels", "staffs"
  add_foreign_key "health_interviews", "hospitals"
  add_foreign_key "health_interviews", "patients"
  add_foreign_key "hospital_labelings", "hospital_labels"
  add_foreign_key "hospital_labelings", "hospitals"
  add_foreign_key "sns_credentials", "patients"
  add_foreign_key "staffs", "hospitals"
end
