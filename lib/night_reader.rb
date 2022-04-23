require './lib/required_files'

input_file = File.open(ARGV[0], "r")
input_message = input_file.read.delete('\n') #.strip
input_file.close
character_length = input_message.length
output_file = File.open(ARGV[1], "w")
output_file.write(input_message)
output_file.close

puts "Created #{ARGV[1]} containing #{character_length} characters"
