# frozen_string_literal: true

class CreateCodedFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :coded_files do |t|
      t.string :last_name, index: true
      t.string :first_name, index: true
      t.string :middle_initial, index: true

      t.string :relocation_center_id, index: true
      t.string :assembly_center_id, index: true

      t.string :last_perm_addr_state_id, index: true
      t.string :last_perm_addr_county_id, index: true
      t.string :last_perm_addr_city_size_id, index: true

      t.string :parent_birth_country_id, index: true
      t.string :father_occ_us_id, index: true
      t.string :father_occ_ja_id, index: true

      t.string :education_ja_total_years_id, index: true
      t.string :education_ja_grades_id, index: true
      t.string :degrees_id, index: true

      t.string :ja_res_year_of_entry, index: true
      t.string :ja_res_total_time_id, index: true
      t.string :ja_res_num_times_id, index: true
      t.string :ja_res_age_id, index: true

      t.string :military_service_id, index: true

      t.string :individual_number, index: true
      t.string :gender_and_martial_status_id, index: true
      t.string :race_of_self_and_spouse_id, index: true

      t.integer :birth_year, index: true
      t.string :birth_place_id, index: true

      t.string :soc_sec_and_lang_school_id, index: true
      t.string :school_grade_id, index: true

      t.string :languages_id, index: true
      t.string :religion_id, index: true

      t.string :occ_qualified_1_id, index: true
      t.string :occ_qualified_2_id, index: true
      t.string :occ_qualified_3_id, index: true
      t.string :occ_potential_1_id, index: true
      t.string :occ_potential_2_id, index: true

      t.string :file_number, index: true

      t.timestamps
    end
  end
end
