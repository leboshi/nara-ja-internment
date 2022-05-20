# frozen_string_literal: true

SOURCE_URL       = 'https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-210/wra/RG210.JAPAN.WRA26.txt?download=true'
SOURCE_FILE_PATH = Rails.root.join('db/RG210.JAPAN.WRA26.txt')

relocation_centers = [
  { id: 1, name: 'Manzanar' },
  { id: 2, name: 'Colorado River' },
  { id: 3, name: 'Gila River' },
  { id: 4, name: 'Tule Lake' },
  { id: 5, name: 'Minidoka' },
  { id: 6, name: 'Central Utah' },
  { id: 7, name: 'Heart Mountain' },
  { id: 8, name: 'Granada' },
  { id: 9, name: 'Rowher' },
  { id: 0, name: 'Jerome' },
  { id: 'R', name: '[UNDEFINED CODE]' }
]
RelocationCenter.insert_all(relocation_centers, unique_by: :id)

assembly_centers = [
  { id: 0, name: 'None' },
  { id: 1, name: 'Manzanar' },
  { id: 2, name: 'Fresno' },
  { id: 3, name: 'Marysville' },
  { id: 4, name: 'Mayer' },
  { id: 5, name: 'Merced' },
  { id: 6, name: 'Pinedale' },
  { id: 7, name: 'Pomona' },
  { id: 8, name: 'Portland' },
  { id: 9, name: 'Puyallup' },
  { id: '-', name: 'Sacramento' },
  { id: 'A', name: 'Salinas' },
  { id: 'B', name: 'Santa Anita' },
  { id: 'C', name: 'Stockton' },
  { id: 'D', name: 'Tanforan' },
  { id: 'E', name: 'Tulare' },
  { id: 'F', name: 'Turlock' },
  { id: 'Z', name: '[UNDEFINED CODE]' }
]
AssemblyCenter.insert_all(assembly_centers, unique_by: :id)

Down.download(SOURCE_URL, destination: SOURCE_FILE_PATH) unless File.exist?(SOURCE_FILE_PATH)

File.foreach(SOURCE_FILE_PATH).each_slice(1000) do |batch|
  parsers = batch.map(&CodedFileParser.method(:new))
  CodedFile.insert_all parsers.select(&:valid?).map(&:attributes)
end
