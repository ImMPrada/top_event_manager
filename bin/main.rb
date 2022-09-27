require 'dotenv/load'

require_relative '../lib/rudimentary'
require_relative '../lib/csv_solution'
require_relative '../lib/gac_solution'

path_to_file = 'event_attendees.csv'

# rudimentary_extraction(path_to_file)
# use_csv(path_to_file)

legislators_by_zipcode(path_to_file)
