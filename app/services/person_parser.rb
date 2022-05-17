# frozen_string_literal: true

class PersonParser
  def initialize(plain_text_row)
    @plain_text_row = plain_text_row
  end

  def to_person
  end

  def valid?
    false
  end

  private
end
