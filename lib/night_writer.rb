class NightWriter
  attr_reader :create_file

  def initialize(create_file)
    @create_file = translate
  end

  def translate
    input_file = File.open(ARGV[0], "r")

    input_message = input_file.read.delete("\n")

    input_file.close

    character_length = input_message.length

    output_file = File.open(ARGV[1], "w")

    output_file.write(input_message)

    output_file.close

    puts "Created #{ARGV[1]} containing #{character_length} characters"
  end
end




# ANOTHER WAY REMOVING .open:
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
