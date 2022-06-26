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
  { id: 0, name: 'Jerome' }
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
  { id: 'F', name: 'Turlock' }
]
AssemblyCenter.insert_all(assembly_centers, unique_by: :id)

parent_birth_countries = [
  { id: 'W', mother: :unknown, father: :unknown },
  { id: 'B', mother: :unknown, father: :japan },
  { id: 'K', mother: :unknown, father: :us },
  { id: 'T', mother: :unknown, father: :hawaii },
  { id: 'Y', mother: :unknown, father: :other },
  { id: 'A', mother: :japan, father: :unknown },
  { id: '1', mother: :japan, father: :japan },
  { id: '2', mother: :japan, father: :us },
  { id: '3', mother: :japan, father: :hawaii },
  { id: 'D', mother: :japan, father: :other },
  { id: 'J', mother: :us, father: :unknown },
  { id: '4', mother: :us, father: :japan },
  { id: '5', mother: :us, father: :us },
  { id: '6', mother: :us, father: :hawaii },
  { id: 'M', mother: :us, father: :other },
  { id: 'S', mother: :hawaii, father: :unknown },
  { id: '7', mother: :hawaii, father: :japan },
  { id: '8', mother: :hawaii, father: :us },
  { id: '9', mother: :hawaii, father: :hawaii },
  { id: 'V', mother: :hawaii, father: :other },
  { id: 'X', mother: :other, father: :unknown },
  { id: 'C', mother: :other, father: :japan },
  { id: 'L', mother: :other, father: :us },
  { id: 'U', mother: :other, father: :hawaii },
  { id: 'Z', mother: :other, father: :other }
]
ParentBirthCountry.insert_all(parent_birth_countries, unique_by: :id)

father_occupations = [
  { id: '&', description: 'Blank, unknown, none, dash' },
  { id: '-', description: 'Unrevised forms (not on schedule)' },
  { id: '1', description: 'Professional & semiprofessional' },
  { id: '2', description: 'Managerial and official (except farm)' },
  { id: '3', description: 'Clerical and sales' },
  { id: '4', description: 'Service' },
  { id: '5', description: 'Farm operators and managers' },
  { id: '6', description: 'Farm laborers including foremen' },
  { id: '7', description: 'Fishermen' },
  { id: '8', description: 'Skilled craftsmen and foremen/Semi-skilled operators (except farm)' },
  { id: '9', description: 'Unskilled laborers (except farm)' }
]
FatherOccupation.insert_all(father_occupations, unique_by: :id)

education_ja_total_years =
  36.times.map do |i|
    { id: i.to_s(36).upcase, years: i }
  end
education_ja_total_years << { id: '&', years: nil }
EducationJaTotalYears.insert_all(education_ja_total_years, unique_by: :id)

education_ja_grades = [
  { id: '&', elementary_school: nil, high_school: nil, higher_ed: nil },
  { id: '0', elementary_school: false, high_school: false, higher_ed: false },
  { id: '1', elementary_school: true, high_school: false, higher_ed: false },
  { id: '2', elementary_school: false, high_school: true, higher_ed: false },
  { id: '3', elementary_school: false, high_school: false, higher_ed: true },
  { id: '4', elementary_school: true, high_school: true, higher_ed: false },
  { id: '5', elementary_school: true, high_school: false, higher_ed: true },
  { id: '6', elementary_school: false, high_school: true, higher_ed: true },
  { id: '7', elementary_school: true, high_school: true, higher_ed: true }
]
EducationJaGrades.insert_all(education_ja_grades, unique_by: :id)

Down.download(SOURCE_URL, destination: SOURCE_FILE_PATH) unless File.exist?(SOURCE_FILE_PATH)

File.foreach(SOURCE_FILE_PATH).each_slice(1000) do |batch|
  parsers = batch.map(&CodedFileParser.method(:new))
  CodedFile.insert_all parsers.select(&:valid?).map(&:attributes)
end
