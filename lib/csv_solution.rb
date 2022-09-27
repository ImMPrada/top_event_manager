require 'byebug'
require 'csv'

def use_csv(path_to_file, have_header: true)
  puts 'Event Manager Initialized!'
  return nil unless File.exist?(path_to_file)

  contents = CSV.open(
    path_to_file,
    headers: have_header,
    header_converters: :symbol
  )

  contents.each { |row| puts "#{row[:first_name]} #{row[:last_name]}: #{fix_zipcode(row[:zipcode])}" }
  contents
end

def fix_zipcode(zipcode)
  zipcode = zipcode.to_s
  return zipcode.rjust(5, '0') if zipcode.length < 5
  return zipcode if zipcode.length == 5

  zipcode[0..4]
end
