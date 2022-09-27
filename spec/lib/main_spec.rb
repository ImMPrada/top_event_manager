require './spec/spec_helper'

describe 'lib/main' do
  describe 'when read_line is called' do
    let(:line) { ' , ,John,Smith,john.smith@mail.com' }

    it 'returns a string' do
      expect(read_line(line)).to be_a(String)
    end

    it 'returns a string with the composed name and email' do
      expect(read_line(line)).to eq('John Smith: john.smith@mail.com')
    end
  end

  describe 'when read_file is called' do
    let(:path_to_file) { './spec/event_attendees_test.csv' }
    let(:returned_array) do
      [
        " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n",
        "1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010\n"
      ]
    end

    it 'returns an array' do
      expect(read_file(path_to_file, false)).to be_a(Array)
    end

    describe 'when have_header is true' do
      it 'returns an array without the header' do
        expect(read_file(path_to_file, true)).to eq(returned_array[1..])
      end
    end

    describe 'when have_header is false' do
      it 'returns an array with the header' do
        expect(read_file(path_to_file, false)).to eq(returned_array)
      end
    end
  end

  describe 'when rudimentary_extraction is called' do
    let(:path_to_file) { './spec/event_attendees_test.csv' }
    let(:path_to_inexisting_file) { './spec/inexisting_file_test.csv' }

    it 'returns nil if the file does not exist' do
      expect(rudimentary_extraction(path_to_inexisting_file)).to be_nil
    end

    it 'returns an array if the file exists' do
      expect(rudimentary_extraction(path_to_file).class).to be(Array)
    end
  end

  describe 'when use_csv is called' do
    let(:path_to_file) { './spec/event_attendees_test.csv' }
    let(:path_to_inexisting_file) { './spec/inexisting_file_test.csv' }

    it 'returns nil if the file does not exist' do
      expect(use_csv(path_to_inexisting_file)).to be_nil
    end

    it 'returns CSV class if the file exists' do
      expect(use_csv(path_to_file).class).to be(CSV)
    end
  end
end
