# frozen_string_literal: true

class EducationJaTotalYears < ApplicationRecord
  has_many :coded_files, dependent: :restrict_with_exception
end
