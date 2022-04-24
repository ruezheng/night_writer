require "./lib/dictionary"
require "./lib/braille_translator"

braille_file = File.open(ARGV[0], "r")
braille_message = braille_file.readline
character_length = braille_message.length

english_message = BrailleTranslator.new.translator(braille_message)

braille_file = File.write(ARGV[1], english_message)

puts "Created #{ARGV[1]} containing #{character_length} characters"
