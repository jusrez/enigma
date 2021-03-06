module Calculable

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

	def final_shifts(key, date)
		final_shifts = []
		the_keys = generate_keys(key)
		the_offsets = generate_offsets(date)
		the_keys.each_index do |i|
			final_shifts << the_keys[i].to_i + the_offsets[i]
		end
		return final_shifts
	end
	
end
