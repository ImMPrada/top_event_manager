require 'byebug'

path_to_file = 'event_attendees.csv'

puts 'Event Manager Initialized!'

return false unless File.exist?(path_to_file)

contents = File.read(path_to_file)
lines = File.readlines(path_to_file)
puts contents

lines.each { |line| puts line }

