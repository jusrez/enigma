require 'date'
class Enigma

	def initialize
		@character_set = ("a".."z").to_a << " "
	end

	# def encrypt(message, key = five_digit_number, date = generate_date)
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

	def generate_keys(key)
		keys = []
		key.split("").each_cons(2){|num_set| keys << num_set.join}
		return keys
	end

	def generate_offsets(date)
		date_squared = date.to_i ** 2
		offsets = date_squared.digits.reverse.last(4)
		return offsets
	end

end
