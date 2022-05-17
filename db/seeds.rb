# frozen_string_literal: true

SOURCE_URL       = 'https://catalog.archives.gov/catalogmedia/lz/electronic-records/rg-210/wra/RG210.JAPAN.WRA26.txt?download=true'
SOURCE_FILE_PATH = Rails.root.join('db/RG210.JAPAN.WRA26.txt')

Down.download(SOURCE_URL, destination: SOURCE_FILE_PATH) unless File.exist?(SOURCE_FILE_PATH)

File.foreach(SOURCE_FILE_PATH) do |line|
  parser = PersonParser.new(line)
  parser.to_person.save! if parser.valid?
end
