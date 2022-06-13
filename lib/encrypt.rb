require_relative './enigma.rb'

message_file = File.open(ARGV[0], "r")
message = message_file.read.chomp


enigma = Enigma.new
encrypted = enigma.encrypt(message, "02715", "040895")

encrypted_message = File.open(ARGV[1], "w")
encrypted_message.write(encrypted[:encryption])


puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
