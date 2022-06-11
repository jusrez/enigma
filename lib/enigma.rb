require 'date'
class Enigma

	def initialize
	end

	# def encrypt(message, key, date = Date.today.strftime("%d%m%y"))
	#
	# end

	def generate_key
		key_set = []
		range = 0..9
		num_set = range.to_a
		while key_set.count < 5
			key_set << num_set.sample
		end
		return key_set.to_s.delete(",[] ")
	end

	def generate_date
		Date.today.strftime("%d%m%y")
	end

end
