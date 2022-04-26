require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english  # method that creates a new instance of Dictionary class and calls on the braille_to_english hash with braille keys and english letters as values
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter) # returns specified english letter value of braille letter keys
    braille_to_english[letter]
  end

  def split_braille_array(braille) # splits every 6 characters into a seperate string
    braille_arr = []
    braille_arr << braille
    string = braille_arr.join.delete("\n") # "0.0.00..0........."
    break_length = ( string.length / 3 )
    string.chars.each_slice(break_length).map(&:join) # => ["0.0.00", "..0...", "......"]
  end

  #
  # def split_braille_array(braille) # splits every 6 characters into a seperate string
  #   braille_arr = []
  #   braille_arr << braille
  #   string = braille_arr.join.delete("\n") # "0.0.00..0........."
  #   string.scan(/....../) # => ["0.0.00", "..0...", "......"]
  # end
  #
  # def nested_braille_arr(split_braille) # turns array of strings into nested arrays
  #   top_row = []
  #   middle_row = []
  #   bottom_row = []
  #   nested_arr = []
  #   top_row << split_braille[0]
  #   middle_row << split_braille[1]
  #   bottom_row << split_braille[2]
  #   nested_arr = top_row, middle_row, bottom_row
  # end
  #
  # def revert_to_braille_letters(mixed_braille) # returns an array of braille letters in the correct order
  #   braille_letter = ""
  #   index = 0
  #   mixed_braille.each do |row|
  #       require "pry"; binding.pry
  #     braille_letter << row[0][0..1]
  #     index += 1
  #   end
  #   braille_letter
  #   # braille_letter.chars.each_slice(6).map(&:join) # ["0.....", "0.0...", "00...."]
  # end

  # def revert_to_braille_letters(mixed_braille) # returns an array of braille letters in the correct order
  #   top_row = []
  #   # middle_row = []
  #   # bottom_row = []
  #   counter = 0
  #   split_arr = braille.each_slice(1).map(&:join).join.scan(/../)
  #   wip = mixed_braille.each do |braille|
  #       require "pry"; binding.pry
  #
  #     letters = braille[counter..counter + 1]
  #     counter +=2
  #     top_row.push(letters)
  #   end
  #   string = [top_row, middle_row, bottom_row].join # => "0.....0.0...00...."
  #   string.chars.each_slice(6).map(&:join) # ["0.....", "0.0...", "00...."]
  # end
  # def revert_to_braille_letters(mixed_braille) # returns an array of braille letters in the correct order
  #   top_row = ""
  #   middle_row = ""
  #   bottom_row = ""
  #   mixed_braille.each do |i|
  #     top_row += i[0][0..1]
  #     middle_row += i[0][2..3]
  #     bottom_row += i[0][4..5]
  #   end
  #   string = [top_row, middle_row, bottom_row].join # => "0.....0.0...00...."
  #   string.chars.each_slice(6).map(&:join) # ["0.....", "0.0...", "00...."]
  # end
  def translate_braille(braille) # iterates through each braille character element in array and returns english values
    english_letters = []
    braille.each do |braille_letter|
      english_letters << translate_letter(braille_letter)
    end
    english_letters.join
  end

  def revert_to_braille_letters(braille) # returns an array of braille letters in the correct order
    braille_line = ""
    braille.each_slice(3) do |braille_row|
      arr = []
      top_row = braille_row[0].chars.each_slice(2).map(&:join)
      middle_row = braille_row[1].chars.each_slice(2).map(&:join)
      bottom_row = braille_row[2].chars.each_slice(2).map(&:join)
      top_row.each_with_index do |two_chars, index|
        arr << [two_chars, middle_row[index], bottom_row[index]]
      end
      braille_line += translate_braille(arr.map(&:join))
    end
    braille_line
  end

  def reverse_translator(braille_message)
    # mixed_braille = split_braille_array(braille_message)
    braille = revert_to_braille_letters(braille_message)
      require "pry"; binding.pry
    english = translate_braille(braille)
    english.chars.each_slice(40).map(&:join).join
  end
end
