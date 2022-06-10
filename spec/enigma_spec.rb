require './lib/enigma'

RSpec.describe Enigma do
	it 'exists' do
		enigma = Enigma.new

		expect(enigma).to be_an_instance_of(Enigma)
	end

	it 'encrypts a message' do
		enigma = Enigma.new

		expect(enigma.encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
	end
end
