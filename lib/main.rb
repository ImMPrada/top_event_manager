require 'byebug'
require 'csv'

path_to_file = 'event_attendees.csv'

def rudimentary_extraction(path_to_file, have_header = true)
  puts 'Event Manager Initialized!'
  return nil unless File.exist?(path_to_file)

  lines = read_file(path_to_file, have_header)

  lines.each { |line| puts read_line(line) }
end

def use_csv(path_to_file, have_header = true)
  puts 'Event Manager Initialized!'
  return nil unless File.exist?(path_to_file)

  contents = CSV.open(path_to_file, headers: have_header)
  contents.each { |row| puts "#{row[(2..3)].join(' ')}: #{row[4]}" }
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

rudimentary_extraction(path_to_file)
use_csv(path_to_file)
