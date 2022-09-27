require './spec/spec_helper'

describe 'lib/gac_solution' do
  describe 'when representations_of_zipcode is called' do
    let(:zipcode) { '80203' }
    let(:invalid_zipcode) { '00000' }

    it 'returns an array' do
      expect(representations_of_zipcode(zipcode).class).to be(Array)
    end

    it 'returns an array of representatives' do
      expect(representations_of_zipcode(zipcode).first.class).to be(Google::Apis::CivicinfoV2::Official)
    end

    it 'returns a message if the zipcode is invalid' do
      expect(representations_of_zipcode(invalid_zipcode)).to eq('You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials')
    end
  end
end
