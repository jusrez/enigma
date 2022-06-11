require './lib/enigma'

RSpec.describe Enigma do
	it 'exists' do
		enigma = Enigma.new

		expect(enigma).to be_an_instance_of(Enigma)
	end

	it 'will generate a random five digit number if one is not provided' do
		enigma = Enigma.new

		expect(enigma.five_digit_number).to be_a(String)
		expect(enigma.five_digit_number.length).to eq(5)
	end

	it 'will generate a date if one is not provided' do
		enigma = Enigma.new

		expect(enigma.generate_date).to be_a(String)
		expect(enigma.generate_date.length).to eq(6)
	end

	it 'will take a five digit number and create four keys from it' do
		enigma = Enigma.new

		expect(enigma.generate_keys(02715)).to be_a(Hash)
		expect(enigma.generate_keys(02715).keys.count).to eq(4)
		expect(enigma.generate_keys(02715)["A"]).to eq(02)
		expect(enigma.generate_keys(02715)["B"]).to eq(27)
		expect(enigma.generate_keys(02715)["C"]).to eq(71)
		expect(enigma.generate_keys(02715)["D"]).to eq(15)
	end


end
