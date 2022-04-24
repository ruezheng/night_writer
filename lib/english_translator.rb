require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english  # method that creates a new instance of Dictionary class and calls on the braille_to_english hash with braille keys and english letters as values
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter) # returns specified english letter value of braille letter keys
    braille_to_english[letter]
  end

  def split_braille_array(braille) # splits every 6 characters into a seperate string
    mixed_braille_arr = []
    mixed_braille_arr << braille
    mixed_braille_arr.join.split("\n") # => ["0.0.00", "..0...", "......"]
  end

  def revert_to_braille_letters(mixed_braille) # returns an array of braille letters in the correct order
    top_row = '#'
    middle_row = '#'
    bottom_row = '#'
    mixed_braille.each do |element|
      top_row += element[0..1]
      middle_row += element[2..3]
      bottom_row += element[4..5]
    end
    string = [top_row, middle_row, bottom_row].join.delete("#") # "0.....0.0...00...."
    string.chars.each_slice(6).map(&:join) # ["0.....", "0.0...", "00...."]
  end

  def translate_braille(braille) # iterates through each braille character element in array and returns english values
    english_letters = []
    braille.each do |braille_letter|
      english_letters << translate_letter(braille_letter)
    end
    english_letters.join
  end

  def reverse_translator(braille_message)
    mixed_braille = split_braille_array(braille_message)
    braille = revert_to_braille_letters(mixed_braille)
    english = translate_braille(braille)
    english.chars.each_slice(40).map(&:join)
  end
end
