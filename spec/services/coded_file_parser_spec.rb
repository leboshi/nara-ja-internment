# frozen_string_literal: true

RSpec.describe CodedFileParser do
  describe '#to_file' do
    it 'returns a new File' do
      expect(described_class.new('OTA       MARY     9B1301216&000--000002583C6424136H611-4      137   90339321111').to_coded_file).to be_a_new CodedFile
    end

    it 'parses out all the correct fields' do
      input      = 'OTA       MARY    M9B1301216&000--000002583C6424136H611-4      137   90339321111'
      coded_file = described_class.new(input).to_coded_file
      expect(coded_file.last_name).to eq('OTA')
      expect(coded_file.first_name).to eq('MARY')
      expect(coded_file.middle_initial).to eq('M')
      expect(coded_file.relocation_center_id).to eq('9')
      expect(coded_file.assembly_center_id).to eq('B')
      expect(coded_file.last_perm_addr_state_id).to eq('13')
      expect(coded_file.last_perm_addr_county_id).to eq('01')
      expect(coded_file.last_perm_addr_city_size_id).to eq('2')
      expect(coded_file.parent_birth_country_id).to eq('1')
      expect(coded_file.father_occ_us_id).to eq('6')
      expect(coded_file.father_occ_ja_id).to eq('&')
      expect(coded_file.education_ja_id).to eq('00')
      expect(coded_file.degrees_id).to eq('0')
      expect(coded_file.ja_res_year_of_entry).to eq('--')
      expect(coded_file.ja_res_total_time_id).to eq('0')
      expect(coded_file.ja_res_num_times_id).to eq('0')
      expect(coded_file.ja_res_age_id).to eq('0')
      expect(coded_file.military_service_id).to eq('0')
      expect(coded_file.individual_number).to eq('02583C')
      expect(coded_file.gender_and_martial_status_id).to eq('6')
      expect(coded_file.race_of_self_and_spouse_id).to eq('4')
      expect(coded_file.birth_year).to eq(24)
      expect(coded_file.birth_place_id).to eq('13')
      expect(coded_file.soc_sec_and_lang_school_id).to eq('6')
      expect(coded_file.school_grade_id).to eq('H')
      expect(coded_file.languages_id).to eq('6')
      expect(coded_file.religion_id).to eq('1')
      expect(coded_file.occ_qualified_1_id).to eq('1-4')
      expect(coded_file.occ_qualified_2_id).to be_blank
      expect(coded_file.occ_qualified_3_id).to be_blank
      expect(coded_file.occ_potential_1_id).to eq('137')
      expect(coded_file.occ_potential_2_id).to be_blank
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
