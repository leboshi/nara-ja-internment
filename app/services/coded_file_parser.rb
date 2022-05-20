# frozen_string_literal: true

class CodedFileParser
  LINE_SCHEMA =
    {
      last_name:                    0..9,
      first_name:                   10..17,
      middle_initial:               18,
      relocation_center_id:         19,
      assembly_center_id:           20,
      last_perm_addr_state_id:      21..22,
      last_perm_addr_county_id:     23..24,
      last_perm_addr_city_size_id:  25,
      parent_birth_country_id:      26,
      father_occ_us_id:             27,
      father_occ_ja_id:             28,
      education_ja_id:              29..30,
      degrees_id:                   31,
      ja_res_year_of_entry:         32..33,
      ja_res_total_time_id:         34,
      ja_res_num_times_id:          35,
      ja_res_age_id:                36,
      military_service_id:          37,
      individual_number:            38..43,
      gender_and_martial_status_id: 44,
      race_of_self_and_spouse_id:   45,
      birth_year:                   46..47,
      birth_place_id:               48..49,
      soc_sec_and_lang_school_id:   50,
      school_grade_id:              51,
      languages_id:                 52,
      religion_id:                  53,
      occ_qualified_1_id:           54..56,
      occ_qualified_2_id:           57..59,
      occ_qualified_3_id:           60..62,
      occ_potential_1_id:           63..65,
      occ_potential_2_id:           66..68,
      file_number:                  69..79
    }.freeze
  private_constant :LINE_SCHEMA

  attr_reader :attributes

  def initialize(plain_text_row)
    @attributes = LINE_SCHEMA.transform_values { |i| plain_text_row[i].presence&.strip }
  end

  def valid?
    @attributes[:file_number].to_s.match?(/\A\d+\z/)
  end
end
