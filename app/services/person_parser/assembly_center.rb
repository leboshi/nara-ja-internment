# frozen_string_literal: true

class PersonParser
  class AssemblyCenter
    MAP = {
      '0': 'None',
      '1': 'Manzanar',
      '2': 'Fresno',
      '3': 'Marysville',
      '4': 'Mayer',
      '5': 'Merced',
      '6': 'Pinedale',
      '7': 'Pomona',
      '8': 'Portland',
      '9': 'Puyallup',
      '-': 'Sacramento',
      'A': 'Salinas',
      'B': 'Santa Anita',
      'C': 'Stockton',
      'D': 'Tenforan',
      'E': 'Tulare',
      'F': 'Turlock'
    }.freeze

    def initialize(code)
      @code = code
    end

    def value
      MAP[@code.upcase.to_sym] if @code
    end
  end
end
