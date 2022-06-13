require './lib/enigma'
require 'date'

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

		expect(enigma.generate_keys("02715")).to be_a(Array)
		expect(enigma.generate_keys("02715").count).to eq(4)
		expect(enigma.generate_keys("02715")[0]).to eq("02")
		expect(enigma.generate_keys("02715")[1]).to eq("27")
		expect(enigma.generate_keys("02715")[2]).to eq("71")
		expect(enigma.generate_keys("02715")[3]).to eq("15")
	end

	it 'will create offsets from the date of transmission' do
		enigma = Enigma.new

		expect(enigma.generate_offsets("040895")).to be_a(Array)
		expect(enigma.generate_offsets("040895").count).to eq(4)
		expect(enigma.generate_offsets("040895")[0]).to eq(1)
		expect(enigma.generate_offsets("040895")[1]).to eq(0)
		expect(enigma.generate_offsets("040895")[2]).to eq(2)
		expect(enigma.generate_offsets("040895")[3]).to eq(5)
	end

	it 'will calculate the final shifts' do
		enigma = Enigma.new

		expect(enigma.final_shifts("02715","040895")).to be_a(Array)
		expect(enigma.final_shifts("02715","040895").count).to eq(4)
		expect(enigma.final_shifts("02715","040895")[0]).to eq(3)
		expect(enigma.final_shifts("02715","040895")[1]).to eq(27)
		expect(enigma.final_shifts("02715","040895")[2]).to eq(73)
		expect(enigma.final_shifts("02715","040895")[3]).to eq(20)

	end

	it 'will encrypt a message with a key and date' do
		enigma = Enigma.new

		expect(enigma.encrypt("hello world","02715","040895")).to be_a(Hash)
		expect(enigma.encrypt("hello world","02715","040895")[:encryption]).to eq("keder ohulw")
		expect(enigma.encrypt("hello world!","02715","040895")[:encryption]).to eq("keder ohulw!")
		expect(enigma.encrypt("HELLO WORLD","02715","040895")[:encryption]).to eq("keder ohulw")
		expect(enigma.encrypt("hello world","02715","040895")[:key]).to eq("02715")
		expect(enigma.encrypt("hello world","02715","040895")[:date]).to eq("040895")

	end

	it 'will encrypt a message with only a key (uses todays date)' do
		enigma = Enigma.new

		expect(enigma.encrypt("hello world", "02715")).to be_a(Hash)
		expect(enigma.encrypt("hello world", "02715")[:encryption]).to be_a(String)
		expect(enigma.encrypt("hello world", "02715")[:date]).to eq(Date.today.strftime("%d%m%y"))
		expect(enigma.encrypt("hello world", "02715")[:key]).to eq("02715")
	end

	it "will encrypt a message (generates random key and uses todays date)" do
		enigma = Enigma.new

		expect(enigma.encrypt("hello world")).to be_a(Hash)
		expect(enigma.encrypt("hello world")[:encryption]).to be_a(String)
		expect(enigma.encrypt("hello world")[:date]).to eq(Date.today.strftime("%d%m%y"))
		expect(enigma.encrypt("hello world")[:key].length).to eq(5)
	end

	it 'will decrypt a message with a key and date' do
		enigma = Enigma.new

		expect(enigma.decrypt("keder ohulw","02715","040895")[:decryption]).to eq("hello world")
		expect(enigma.decrypt("keder ohulw!","02715","040895")[:decryption]).to eq("hello world!")
		expect(enigma.decrypt("keder ohulw","02715","040895")[:key]).to eq("02715")
		expect(enigma.decrypt("keder ohulw","02715","040895")[:date]).to eq("040895")
	end

	it 'will decrypt a message with a key (uses todays date)' do
		enigma = Enigma.new
		encrypted = enigma.encrypt("hello world", "02715")

		expect(enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
		expect(enigma.decrypt(encrypted[:encryption], "02715")[:decryption]).to be_a(String)
		expect(enigma.decrypt(encrypted[:encryption], "02715")[:key]).to eq("02715")
		expect(enigma.decrypt(encrypted[:encryption], "02715")[:date]).to eq(Date.today.strftime("%d%m%y"))
	end


end
