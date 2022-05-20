# frozen_string_literal: true

RSpec.describe CodedFileParser do
  describe '#attributes' do
    it 'parses out all the correct fields' do
      input      = 'OTA       MARY    M9B1301216&000--000002583C6424136H611-4      137   90339321111'
      attributes = described_class.new(input).attributes
      expect(attributes[:last_name]).to eq('OTA')
      expect(attributes[:first_name]).to eq('MARY')
      expect(attributes[:middle_initial]).to eq('M')
      expect(attributes[:relocation_center_id]).to eq('9')
      expect(attributes[:assembly_center_id]).to eq('B')
      expect(attributes[:last_perm_addr_state_id]).to eq('13')
      expect(attributes[:last_perm_addr_county_id]).to eq('01')
      expect(attributes[:last_perm_addr_city_size_id]).to eq('2')
      expect(attributes[:parent_birth_country_id]).to eq('1')
      expect(attributes[:father_occ_us_id]).to eq('6')
      expect(attributes[:father_occ_ja_id]).to eq('&')
      expect(attributes[:education_ja_id]).to eq('00')
      expect(attributes[:degrees_id]).to eq('0')
      expect(attributes[:ja_res_year_of_entry]).to eq('--')
      expect(attributes[:ja_res_total_time_id]).to eq('0')
      expect(attributes[:ja_res_num_times_id]).to eq('0')
      expect(attributes[:ja_res_age_id]).to eq('0')
      expect(attributes[:military_service_id]).to eq('0')
      expect(attributes[:individual_number]).to eq('02583C')
      expect(attributes[:gender_and_martial_status_id]).to eq('6')
      expect(attributes[:race_of_self_and_spouse_id]).to eq('4')
      expect(attributes[:birth_year]).to eq('24')
      expect(attributes[:birth_place_id]).to eq('13')
      expect(attributes[:soc_sec_and_lang_school_id]).to eq('6')
      expect(attributes[:school_grade_id]).to eq('H')
      expect(attributes[:languages_id]).to eq('6')
      expect(attributes[:religion_id]).to eq('1')
      expect(attributes[:occ_qualified_1_id]).to eq('1-4')
      expect(attributes[:occ_qualified_2_id]).to be_blank
      expect(attributes[:occ_qualified_3_id]).to be_blank
      expect(attributes[:occ_potential_1_id]).to eq('137')
      expect(attributes[:occ_potential_2_id]).to be_blank
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
