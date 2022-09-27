require 'dotenv/load'
require './lib/rudimentary'
require './lib/csv_solution'
require './lib/gac_solution'


RSpec.configure do |config|
  # Use the specified formatter
  config.formatter = :documentation
end

