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
end
