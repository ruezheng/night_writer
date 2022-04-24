require "./lib/dictionary"
require "./lib/braille_translator"

input_file = File.open(ARGV[0], "r")
input_message = input_file.readline
character_length = input_message.length

output_message = BrailleTranslator.new.translator(input_message)

braille_file = File.open(ARGV[1], "w")
  braille_file.write(output_message)
  braille_file.close

puts "Created #{ARGV[1]} containing #{character_length} characters"
