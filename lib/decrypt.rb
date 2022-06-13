require_relative './enigma.rb'

encrypted_file = File.open(ARGV[0], "r")
ciphertext = encrypted_file.read.chomp

enigma = Enigma.new
decrypted = enigma.decrypt(ciphertext, ARGV[2].to_s, ARGV[3].to_s)

decrypted_message = File.open(ARGV[1], "w")
decrypted_message.write(decrypted[:decryption])

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
