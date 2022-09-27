require 'byebug'

path_to_file = 'event_attendees.csv'

def rudimentary_extraction(path_to_file, have_header = true)
  puts 'Event Manager Initialized!'
  return false unless File.exist?(path_to_file)

  jump_first_line = have_header
  lines = File.readlines(path_to_file)
  lines.each do |line|
    if jump_first_line
      jump_first_line = false
      next
    end

    columns = line.split(',')
    name = columns[(2..3)].join(' ')
    email = columns[4]
    puts "#{name} --- #{email}"
  end
end

rudimentary_extraction(path_to_file)
