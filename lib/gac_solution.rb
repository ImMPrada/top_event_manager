require 'google/apis/civicinfo_v2'
require 'byebug'
require_relative 'csv_solution'

CIVIC_INFO = Google::Apis::CivicinfoV2::CivicInfoService.new
CIVIC_INFO.key = ENV['GAC_API_KEY']
CALL_ERROR_MESSAGE = 'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'.freeze

def representations_of_zipcode(zipcode)
  response = CIVIC_INFO.representative_info_by_address(
    address: zipcode,
    levels: 'country',
    roles: %w[legislatorUpperBody legislatorLowerBody]
  )

  response.officials
rescue Google::Apis::ServerError, Google::Apis::ClientError
  CALL_ERROR_MESSAGE
end
