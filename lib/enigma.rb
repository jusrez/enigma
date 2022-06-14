require 'date'
require_relative './calculable'

class Enigma
	include Calculable

	def initialize
		@character_set = ("a".."z").to_a << " "
	end

	def encrypt(message, key = five_digit_number, date = generate_date)
		encrypted_message = []
		shifts = final_shifts(key, date)
		message_array = message.downcase.split("")
		message_array.each.with_index do |letter, i|
			encrypted_message << @character_set.rotate(@character_set.find_index(letter) + shifts.rotate(i)[0])[0] if @character_set.include?(letter)
			encrypted_message << letter if @character_set.include?(letter) == false
		end
		return Hash(encryption: encrypted_message.join, key: key, date: date)
	end

	def decrypt(ciphertext, key, date = generate_date)
		decrypted_message = []
		shifts = final_shifts(key, date)
		ciphertext_array = ciphertext.downcase.split("")
		ciphertext_array.each.with_index do |letter, i|
			decrypted_message << @character_set.rotate(@character_set.find_index(letter) - shifts.rotate(i)[0])[0] if @character_set.include?(letter)
			decrypted_message << letter if @character_set.include?(letter) == false
		end
		return Hash(decryption: decrypted_message.join, key: key, date: date)
	end


	
end
