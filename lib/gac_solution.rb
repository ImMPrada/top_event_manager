require 'google/apis/civicinfo_v2'
require_relative 'csv_solution'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
response = civic_info.representative_info_by_address(address: 80202, levels: 'country', roles: ['legislatorUpperBody', 'legislatorLowerBody'])

response.officials.each do |official|
  puts official.name
end
