require "./lib/dictionary"
require "./lib/braille_translator"

english_file = File.open(ARGV[0], "r")
english_message = english_file.readline
character_length = english_message.length

braille_message = BrailleTranslator.new.translator(english_message)

braille_file = File.write(ARGV[1], braille_message)

puts "Created #{ARGV[1]} containing #{character_length} characters"
