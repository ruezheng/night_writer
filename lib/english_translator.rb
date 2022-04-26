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

  def translate_braille(braille) # iterates through each braille character element in array and returns english values
    english_letters = []
    braille.each do |braille_letter|
      english_letters << translate_letter(braille_letter)
    end
    english_letters.join
  end

  def revert_to_braille_letters(braille) # returns an array of braille letters in the correct order then translates letters to english
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
    mixed_braille = split_braille_array(braille_message)
    english = revert_to_braille_letters(mixed_braille)
    english.chars.each_slice(40).map(&:join).join
  end
end
