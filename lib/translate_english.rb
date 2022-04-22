require './lib/night_writer'

class EnglishToBraille
  attr_reader :file

  def initialize
    @file = './lib/night_writer.rb'
  end
end



# input_file = File.read(ARGV[0]) # [0] to read specific line
# # input_file = File.readlines(ARGV[0])[0] to read specific line
#
# # input_file.close
#
# # puts input_message
#
# character_length = input_file.length
#
# output_file = File.write(ARGV[1], input_file.braille)
#
# # output_file.close
#
# puts "Created #{ARGV[1]} containing #{character_length} characters"
