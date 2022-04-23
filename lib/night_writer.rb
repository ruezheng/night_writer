input_file = File.open(ARGV[0], "r")
input_message = input_file.read.delete("\n").chomp
character_length = input_message.length
braille_file = File.write(ARGV[1], input_message)
# braille_file = File.open(ARGV[1], "w")
# braille_file.write(input_message)
# braille_file.close

# translate = Translate.new(input_message, braille_file)

puts "Created #{ARGV[1]} containing #{character_length} characters"
