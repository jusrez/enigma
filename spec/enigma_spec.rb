require './lib/enigma'

RSpec.describe Enigma do
	it 'exists' do
		enigma = Enigma.new

		expect(enigma).to be_an_instance_of(Enigma)
	end

	it 'will generate a key if one is not provided' do
		enigma = Enigma.new

		expect(enigma.generate_key).to be_a(String)
		expect(enigma.generate_key.length).to eq(5)
	end


end
