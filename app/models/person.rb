# frozen_string_literal: true

class Person < ApplicationRecord
  enum relocation_center: {
    Manzanar:         1,
    'Colorado River': 2,
    'Gila River':     3,
    'Tule Lake':      4,
    Minidoka:         5,
    'Central Utah':   6,
    'Heart Mountain': 7,
    Granada:          8,
    Rohwer:           9,
    Jerome:           0
  },
       _suffix:           'relocation_center'

  enum assembly_center: {
    None:          0,
    Manzanar:      1,
    Fresno:        2,
    Marysville:    3,
    Mayer:         4,
    Merced:        5,
    Pinedale:      6,
    Pomona:        7,
    Portland:      8,
    Puyallup:      9,
    Sacramento:    10,
    Salinas:       11,
    'Santa Anita': 12,
    Stockton:      13,
    Tenforan:      14,
    Tulare:        15,
    Turlock:       16
  },
       _suffix:         'assembly_center'

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
