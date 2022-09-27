require 'byebug'
require 'csv'

path_to_file = 'event_attendees.csv'

def rudimentary_extraction(path_to_file, have_header: true)
  puts 'Event Manager Initialized!'
  return nil unless File.exist?(path_to_file)

  lines = read_file(path_to_file, have_header)

  lines.each { |line| puts read_line(line) }
end

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

def read_file(path_to_file, have_header)
  have_header ? File.readlines(path_to_file)[1..] : File.readlines(path_to_file)
end

def read_line(line)
  columns = line.split(',')
  name = columns[(2..3)].join(' ')
  email = columns[4]
  "#{name}: #{email}"
end

def fix_zipcode(zipcode)
  zipcode = '' if zipcode.nil?

  return zipcode.rjust(5, '0') if zipcode.length < 5
  return zipcode if zipcode.length == 5

  zipcode[0..4]
end

rudimentary_extraction(path_to_file)
use_csv(path_to_file)
