require_relative './enigma.rb'

message_file = File.open(ARGV[0], "r")
read = message_file.read.chomp


enigma = Enigma.new
encrypted = enigma.encrypt(read, "02715", "040895")

write_file = File.open(ARGV[1], "w")
write_file.write(encrypted[:encryption])


puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
