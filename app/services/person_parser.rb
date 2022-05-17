# frozen_string_literal: true

class PersonParser
  LINE_SCHEMA =
    {
      last_name:                 0..9,
      first_name:                10..17,
      middle_initial:            18,
      relocation_center:         19,
      assembly_center:           20,
      last_perm_address:         21..25,
      birth_country:             26,
      father_occ_us:             27,
      father_occ_ja:             28,
      education_ja:              29..30,
      degrees:                   31,
      ja_res_year_of_entry:      32..33,
      ja_res_total_time:         34,
      ja_res_num_times:          35,
      ja_res_age:                36,
      military_service:          37,
      id:                        38..43,
      gender_and_martial_status: 44,
      race_of_self_and_spouse:   45,
      birth_year:                46..47,
      birth_place:               48..49,
      soc_sec_and_lang_school:   50,
      school_grade:              51,
      languages:                 52,
      religion:                  53,
      occ_qualified_1:           54..56,
      occ_qualified_2:           57..59,
      occ_qualified_3:           60..62,
      occ_potential_1:           63..65,
      occ_potential_2:           66..68,
      file_number:               69..79
    }.freeze
  private_constant :LINE_SCHEMA

  def initialize(plain_text_row)
    @raw_values = LINE_SCHEMA.transform_values { |i| plain_text_row[i].presence&.strip }
  end

  def to_person
    Person.new(person_attributes)
  end

  def valid?
    @raw_values[:file_number].to_s.match?(/\A\d+\z/)
  end

  private

  def person_attributes
    @raw_values.slice(:last_name, :first_name, :middle_initial)
               .merge(relocation_center: RelocationCenter.new(@raw_values[:relocation_center]).value,
                      assembly_center:   AssemblyCenter.new(@raw_values[:assembly_center]).value)
  end
end
