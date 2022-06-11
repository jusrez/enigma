require 'date'
class Enigma

	def initialize
		@character_set = ("a".."z").to_a << " "
	end

	# def encrypt(message, key = generate_key, date = generate_date)
	#
	# end

	def five_digit_number
		key_set = []
		num_set = (0..9).to_a
		while key_set.count < 5
			key_set << num_set.sample
		end
		return key_set.to_s.delete(",[] ")
	end

	def generate_date
		Date.today.strftime("%d%m%y")
	end

	def generate_keys(numbers)
		keys = []
		numbers.split("").each_cons(2){|num_set| keys << num_set.join}
		return keys
	end

end
