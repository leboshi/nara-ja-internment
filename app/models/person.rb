# frozen_string_literal: true

class Person < ApplicationRecord
  enum relocation_center: {}
  enum assembly_center: {}
  enum last_address_size: {}
  enum mother_birth_country: {}
  enum father_birth_country: {}
  enum father_occupation_us: {}
  enum father_occupation_ja: {}
  enum education_ja: {}
  enum degrees: {}
  enum ja_res_total_time: {}
  enum ja_res_num_times: {}
  enum ja_res_age: {}
  enum military_service: {}
  enum gender: {}
  enum marital_status: {}
  enum race: {}
  enum spouse_race: {}
  enum soc_sec_status: {}
  enum highest_grade_completed: {}
  enum religion: {}
end
