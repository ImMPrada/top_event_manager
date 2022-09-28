require './spec/spec_helper'

describe 'lib/csv_solution' do
  describe 'when use_csv is called' do
    let(:path_to_file) { './spec/event_attendees_test.csv' }
    let(:path_to_inexisting_file) { './spec/inexisting_file_test.csv' }

    it 'returns nil if the file does not exist' do
      expect(use_csv(path_to_inexisting_file)).to be_nil
    end

    it 'returns Array if the file exists' do
      expect(use_csv(path_to_file).class).to be(Array)
    end
  end

  describe 'when fix_zipcode is called' do
    let(:zipcode) { '20010' }
    let(:long_zipcode) { "#{zipcode}43534" }
    let(:short_zipcode) { '123' }
    let(:nil_zipcode) { nil }

    it 'returns a string' do
      expect(fix_zipcode(zipcode)).to be_a(String)
    end

    describe 'when the zipcode is exactly five digits' do
      it 'returns the zipcode' do
        expect(fix_zipcode(zipcode)).to eq(zipcode)
      end
    end

    describe 'when the zipcode is more than five digits' do
      it 'returns the first five digits' do
        expect(fix_zipcode(long_zipcode)).to eq(zipcode)
      end
    end

    describe 'when the zipcode is less than five digits' do
      it 'returns the zipcode with zeros in front' do
        expect(fix_zipcode(short_zipcode)).to eq("00#{short_zipcode}")
      end
    end

    describe 'when the zipcode is nil' do
      it 'returns 00000 zipcode' do
        expect(fix_zipcode(nil_zipcode)).to eq('00000')
      end
    end
  end
end
