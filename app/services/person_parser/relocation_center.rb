# frozen_string_literal: true

class PersonParser
  class RelocationCenter
    MAP = [
      'Jerome',
      'Manzanar',
      'Colorado River',
      'Gila River',
      'Tule Lake',
      'Minidoka',
      'Central Utah',
      'Heart Mountain',
      'Granada',
      'Rohwer'
    ].freeze

    def initialize(code)
      @code = code
    end

    def value
      MAP[@code.to_i] if @code
    end
  end
end
