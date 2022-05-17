# frozen_string_literal: true

RSpec.describe PersonParser do
  describe '#to_person' do
    it 'returns a new Person' do
      expect(described_class.new('OTA       MARY     9B1301216&000--000002583C6424136H611-4      137   90339321111').to_person).to be_a_new Person
    end

    it 'parses out last name, first name, and middle initial directly' do
      input  = 'OTA       MARY    M9B1301216&000--000002583C6424136H611-4      137   90339321111'
      person = described_class.new(input).to_person
      expect(person.last_name).to eq('OTA')
      expect(person.first_name).to eq('MARY')
      expect(person.middle_initial).to eq('M')
    end

    it 'finds the relocation center by index' do
      input  = 'OTA       MARY     9B1301216&000--000002583C6424136H611-4      137   90339321111'
      person = described_class.new(input).to_person
      expect(person.relocation_center).to eq('Rohwer')
    end

    it 'finds the assembly center by index' do
      input  = 'OTA       MARY     9B1301216&000--000002583C6424136H611-4      137   90339321111'
      person = described_class.new(input).to_person
      expect(person.assembly_center).to eq('Santa Anita')
    end

    it 'finds the assembly center when numbered' do
      input  = 'OTA       MARY     921301216&000--000002583C6424136H611-4      137   90339321111'
      person = described_class.new(input).to_person
      expect(person.assembly_center).to eq('Fresno')
    end

    it 'finds the assembly center when weird' do
      input  = 'OTA       MARY     9-1301216&000--000002583C6424136H611-4      137   90339321111'
      person = described_class.new(input).to_person
      expect(person.assembly_center).to eq('Sacramento')
    end
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
