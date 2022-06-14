require 'date'
require_relative './calculable'

class Enigma
	include Calculable

	def initialize
		@char_set = ("a".."z").to_a << " "
	end

	def encrypt(message, key = five_digit_number, date = generate_date)
		encrypted_message = []
		shifts = final_shifts(key, date)
		message_array = message.downcase.split("")
		message_array.each.with_index do |letter, i|
			if @char_set.include?(letter) == false
				encrypted_message << letter
			else
				encrypted_message << @char_set.rotate(@char_set.find_index(letter) + shifts.rotate(i)[0])[0]
			end
		end
		return Hash(encryption: encrypted_message.join, key: key, date: date)
	end

	def decrypt(ciphertext, key, date = generate_date)
		decrypted_message = []
		shifts = final_shifts(key, date)
		ciphertext_array = ciphertext.downcase.split("")
		ciphertext_array.each.with_index do |letter, i|
			if @char_set.include?(letter) == false
				decrypted_message << letter
			else
			decrypted_message << @char_set.rotate(@char_set.find_index(letter) - shifts.rotate(i)[0])[0]
			end 
		end
		return Hash(decryption: decrypted_message.join, key: key, date: date)
	end



end
