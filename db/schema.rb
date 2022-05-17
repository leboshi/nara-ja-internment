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

ActiveRecord::Schema[7.0].define(version: 2022_05_17_053631) do
  create_table "people", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_initial"
    t.integer "relocation_center"
    t.integer "assembly_center"
    t.string "last_address_state"
    t.string "last_address_county"
    t.integer "last_address_size"
    t.integer "mother_birth_country"
    t.integer "father_birth_country"
    t.integer "father_occupation_us"
    t.integer "father_occupation_ja"
    t.integer "education_ja"
    t.integer "degrees"
    t.integer "ja_res_year_of_entry"
    t.integer "ja_res_total_time"
    t.integer "ja_res_num_times"
    t.integer "ja_res_age"
    t.integer "military_service"
    t.string "individual_number"
    t.integer "gender"
    t.integer "marital_status"
    t.integer "race"
    t.integer "spouse_race"
    t.integer "birth_year"
    t.string "birth_place"
    t.boolean "attended_ja_lang_school"
    t.integer "soc_sec_status"
    t.integer "highest_grade_completed"
    t.boolean "highest_grade_in_us"
    t.boolean "read_write_en"
    t.boolean "speak_en"
    t.boolean "read_write_ja"
    t.boolean "speak_ja"
    t.boolean "read_write_other"
    t.boolean "speak_other"
    t.integer "religion"
    t.string "occupation_qualified_1"
    t.string "occupation_qualified_2"
    t.string "occupation_qualified_3"
    t.string "occupation_potential_1"
    t.string "occupation_potential_2"
    t.string "file_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
