# frozen_string_literal: true

class FatherOccupation < ApplicationRecord
  has_many :coded_files_as_us, class_name: 'CodedFile', foreign_key: :father_occ_us_id, inverse_of: :father_occ_in_us, dependent: :restrict_with_exception
  has_many :coded_files_as_ja, class_name: 'CodedFile', foreign_key: :father_occ_ja_id, inverse_of: :father_occ_in_ja, dependent: :restrict_with_exception
end
