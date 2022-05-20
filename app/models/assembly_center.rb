# frozen_string_literal: true

class AssemblyCenter < ApplicationRecord
  has_many :coded_files, dependent: :restrict_with_exception
end
