require 'google/apis/civicinfo_v2'
require 'byebug'
require_relative 'csv_solution'

CIVIC_INFO = Google::Apis::CivicinfoV2::CivicInfoService.new
CIVIC_INFO.key = ENV['GAC_API_KEY']
CALL_ERROR_MESSAGE = 'Visit www.commoncause.org/take-action/find-elected-officials'.freeze
RATE_LIMIT_ERROR_MESSAGE = 'Rate limit reached, please try later'.freeze

def representations_of_zipcode(zipcode)
  puts "Getting representatives for #{zipcode}..."
  response = call_to_api(zipcode)
  legislators_names(response.officials)
rescue Google::Apis::ServerError, Google::Apis::ClientError
  CALL_ERROR_MESSAGE
rescue Google::Apis::RateLimitError
  RATE_LIMIT_ERROR_MESSAGE
end

def call_to_api(zipcode)
  CIVIC_INFO.representative_info_by_address(
    address: zipcode,
    levels: 'country',
    roles: %w[legislatorUpperBody legislatorLowerBody]
  )
end

def legislators_names(legislators)
  legislators.map(&:name)
end

def legislators_by_zipcode(path_to_file)
  contents = use_csv(path_to_file)
  response = []

  contents.each do |row|
    name = row[:name]
    zipcode = row[:zipcode]
    next if zipcode == '00000'

    legislators = representations_of_zipcode(zipcode)
    response << { name:, zipcode:, legislators: }
  end

  puts response
end
