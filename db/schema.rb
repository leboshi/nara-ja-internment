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

ActiveRecord::Schema[7.0].define(version: 2022_05_20_030114) do
  create_table "assembly_centers", id: :string, force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_assembly_centers_on_name"
  end

  create_table "coded_files", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_initial"
    t.string "relocation_center_id"
    t.string "assembly_center_id"
    t.string "last_perm_addr_state_id"
    t.string "last_perm_addr_county_id"
    t.string "last_perm_addr_city_size_id"
    t.string "parent_birth_country_id"
    t.string "father_occ_us_id"
    t.string "father_occ_ja_id"
    t.string "education_ja_id"
    t.string "degrees_id"
    t.string "ja_res_year_of_entry"
    t.string "ja_res_total_time_id"
    t.string "ja_res_num_times_id"
    t.string "ja_res_age_id"
    t.string "military_service_id"
    t.string "individual_number"
    t.string "gender_and_martial_status_id"
    t.string "race_of_self_and_spouse_id"
    t.integer "birth_year"
    t.string "birth_place_id"
    t.string "soc_sec_and_lang_school_id"
    t.string "school_grade_id"
    t.string "languages_id"
    t.string "religion_id"
    t.string "occ_qualified_1_id"
    t.string "occ_qualified_2_id"
    t.string "occ_qualified_3_id"
    t.string "occ_potential_1_id"
    t.string "occ_potential_2_id"
    t.string "file_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_center_id"], name: "index_coded_files_on_assembly_center_id"
    t.index ["birth_place_id"], name: "index_coded_files_on_birth_place_id"
    t.index ["birth_year"], name: "index_coded_files_on_birth_year"
    t.index ["degrees_id"], name: "index_coded_files_on_degrees_id"
    t.index ["education_ja_id"], name: "index_coded_files_on_education_ja_id"
    t.index ["father_occ_ja_id"], name: "index_coded_files_on_father_occ_ja_id"
    t.index ["father_occ_us_id"], name: "index_coded_files_on_father_occ_us_id"
    t.index ["file_number"], name: "index_coded_files_on_file_number"
    t.index ["first_name"], name: "index_coded_files_on_first_name"
    t.index ["gender_and_martial_status_id"], name: "index_coded_files_on_gender_and_martial_status_id"
    t.index ["individual_number"], name: "index_coded_files_on_individual_number"
    t.index ["ja_res_age_id"], name: "index_coded_files_on_ja_res_age_id"
    t.index ["ja_res_num_times_id"], name: "index_coded_files_on_ja_res_num_times_id"
    t.index ["ja_res_total_time_id"], name: "index_coded_files_on_ja_res_total_time_id"
    t.index ["ja_res_year_of_entry"], name: "index_coded_files_on_ja_res_year_of_entry"
    t.index ["languages_id"], name: "index_coded_files_on_languages_id"
    t.index ["last_name"], name: "index_coded_files_on_last_name"
    t.index ["last_perm_addr_city_size_id"], name: "index_coded_files_on_last_perm_addr_city_size_id"
    t.index ["last_perm_addr_county_id"], name: "index_coded_files_on_last_perm_addr_county_id"
    t.index ["last_perm_addr_state_id"], name: "index_coded_files_on_last_perm_addr_state_id"
    t.index ["middle_initial"], name: "index_coded_files_on_middle_initial"
    t.index ["military_service_id"], name: "index_coded_files_on_military_service_id"
    t.index ["occ_potential_1_id"], name: "index_coded_files_on_occ_potential_1_id"
    t.index ["occ_potential_2_id"], name: "index_coded_files_on_occ_potential_2_id"
    t.index ["occ_qualified_1_id"], name: "index_coded_files_on_occ_qualified_1_id"
    t.index ["occ_qualified_2_id"], name: "index_coded_files_on_occ_qualified_2_id"
    t.index ["occ_qualified_3_id"], name: "index_coded_files_on_occ_qualified_3_id"
    t.index ["parent_birth_country_id"], name: "index_coded_files_on_parent_birth_country_id"
    t.index ["race_of_self_and_spouse_id"], name: "index_coded_files_on_race_of_self_and_spouse_id"
    t.index ["religion_id"], name: "index_coded_files_on_religion_id"
    t.index ["relocation_center_id"], name: "index_coded_files_on_relocation_center_id"
    t.index ["school_grade_id"], name: "index_coded_files_on_school_grade_id"
    t.index ["soc_sec_and_lang_school_id"], name: "index_coded_files_on_soc_sec_and_lang_school_id"
  end

  create_table "relocation_centers", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_relocation_centers_on_name"
  end

  add_foreign_key "coded_files", "assembly_centers"
  add_foreign_key "coded_files", "relocation_centers"
end
