# frozen_string_literal: true

class ParentBirthCountry < ApplicationRecord
  COUNTRIES = {
    unknown: 0,
    japan:   1,
    us:      2,
    hawaii:  3,
    other:   4
  }.freeze

  has_many :coded_files, dependent: :restrict_with_exception

  enum mother: COUNTRIES, _prefix: :mother_born_in
  enum father: COUNTRIES, _prefix: :father_born_in
end
