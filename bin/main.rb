require 'dotenv/load'

require_relative '../lib/rudimentary'
require_relative '../lib/csv_solution'
require_relative '../lib/gac_solution'
require_relative '../lib/template_fill'

system 'clear'
path_to_file = 'event_attendees.csv'

# rudimentary_extraction(path_to_file)
# use_csv(path_to_file)

data = legislators_by_zipcode(path_to_file)
data_for_erb = legislators_by_zipcode(path_to_file, false)

html_template = File.read('form-letter.html')
erb_template = File.read('form_letter.erb')

fill_template(html_template, data[1])

data_for_erb.each { |data| fill_erb_template(erb_template, data) }
