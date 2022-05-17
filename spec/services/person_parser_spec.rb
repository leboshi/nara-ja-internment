# frozen_string_literal: true

RSpec.describe PersonParser do
  describe '#to_person' do
  end

  describe '#valid?' do
    it 'is true when the file_number is purely numeric' do
      parser = described_class.new('TEST      TEST     20136201--81028785010022A730693-Z21319      62504320824862084')
      expect(parser).to be_valid
    end

    it 'is false when the file_number is blank' do
      parser = described_class.new('TEST      TEST     20136201--81028785010022A730693-Z21319      62A043           ')
      expect(parser).not_to be_valid
    end

    it 'is false when the file_number contains non-numeric characters' do
      parser = described_class.new('TEST      TEST     20136201--81028785010022A730693-Z21319      62A04320D2C862B84')
      expect(parser).not_to be_valid
    end
  end
end
