# NARA Japanese American Internment Database

Rails interface onto NARA Record Group 210, containing information on interned Japanese Americans from WRA Form 26.
Information has been privided by [the US National Archives](https://catalog.archives.gov/id/574045) as an unrestricted
data source.

If you are unfamiliar with the internment of Japanese Americans during World War II, plenty of information is
available online:
* https://www.archives.gov/education/lessons/japanese-relocation
* https://en.wikipedia.org/wiki/Internment_of_Japanese_Americans

The US National Archives Catalog compiled these records in the late '80s as a series of punch cards.  They were
digitized into a flat file, but the schema remains difficult to parse out manually.  The Access to Archival Databases
(AAD) system does present a semi-useful interface onto the data, but it is seriously limited in filtering and exporting
capabilities.  This app allows more expressive and complex usage of the data using ActiveRecord.

## Dependencies

Requires Ruby 3.1.2.  Uses SQLite3 by default; if you want another database, you can set it up yourself.  It's frankly
not large enough a dataset to really warrant any heavy lifting.

## Setup

Just run `rails db:prepare`.  The app will automatically download the plaintext data set from the NARA and import it.

If the automated downloader encounters an issue, just go to https://catalog.archives.gov/id/1264228, download the TXT
file under the "Electronic Records" header, and place it in the `db` folder.

## Testing

Run `rails spec`.

## Contributing

Please run `rubocop -A` to lint your branch before submitting pull requests.  Any help is welcome and appreciated!

If you would like to contact me, please find my email address at [my website](https://ryanhkerr.com).

## Legal Notices

Please see [the license](LICENSE).
