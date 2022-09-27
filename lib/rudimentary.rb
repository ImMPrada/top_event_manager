require 'byebug'

def rudimentary_extraction(path_to_file, have_header: true)
  puts 'Event Manager Initialized!'
  return nil unless File.exist?(path_to_file)

  lines = read_file(path_to_file, have_header)

  lines.each { |line| puts read_line(line) }
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
