require "./lib/dictionary"
require "./lib/braille_translator"

braille_file = File.open(ARGV[0], "r")
braille_message = braille_file.read
character_length = ( braille_message.length / 6 )

english_message = EnglishTranslator.new.reverse_translator(braille_message)

braille_file = File.write(ARGV[1], english_message)

puts "Created #{ARGV[1]} containing #{character_length} characters"
