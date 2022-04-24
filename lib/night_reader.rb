require "./lib/dictionary"
require "./lib/english_translator"

input_file = File.open(ARGV[0], "r")
braille = input_file.readline
character_length = braille.length

english_message = BrailleTranslator.new.translator(braille)

output_file = File.open(ARGV[1], "w")
  output_file.write(english_message)
  output_file.close

puts "Created #{ARGV[1]} containing #{character_length} characters"
