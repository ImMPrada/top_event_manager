require 'byebug'

path_to_file = 'event_attendees.csv'

puts 'Event Manager Initialized!'

contents = File.read(path_to_file) if File.exist?(path_to_file)
puts contents

