# frozen_string_literal: true

class CodedFile < ApplicationRecord
  belongs_to :relocation_center, optional: true
  belongs_to :assembly_center, optional: true
  belongs_to :parent_birth_country, optional: true
  belongs_to :father_occ_in_us, class_name: 'FatherOccupation', optional: true
  belongs_to :father_occ_in_ja, class_name: 'FatherOccupation', optional: true
end
