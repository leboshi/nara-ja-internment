# frozen_string_literal: true

class CodedFile < ApplicationRecord
  belongs_to :relocation_center, optional: true
  belongs_to :assembly_center, optional: true
end
