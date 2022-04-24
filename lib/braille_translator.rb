require "./lib/dictionary"

class BrailleTranslator

  def english_to_braille # method that creates a new instance of Dictionary class and calls on english_to_braille hash with english letters as keys and braille letters as values
    Dictionary.new.english_to_braille
  end

  def translate_letter(letter) # returns specified braille value of english letters as their keys
    english_to_braille[letter]
  end

  def translate_char(english) # iterates through each english character in the attribute and returns braille values in an array of strings for each english letter key => ["0.....", "0.0...", "00...."]
    braille_letter = []
    english.chars.each do |letter|
      braille_letter << translate_letter(letter)
    end
    braille_letter
  end

  def formatter(braille) # formats each element of braille array into one string with reformatted braille letters joined with indents to make 2 columns of 3 row characters
    top_row = "#"
    middle_row = "#"
    bottom_row = "#" # placeholder b/c it wouldn't let me add to an empty string
    braille.each do |braille_letter|
      top_row += braille_letter[0..1]
      middle_row += braille_letter[2..3]
      bottom_row += braille_letter[4..5]
    end
    [top_row, middle_row, bottom_row].join("\n").delete("#")
  end

  def translator(english_message) # takes a string (message.txt) and returns all characters in braille form
    english = english_message.delete("\n") # removes indents from string
    unformatted_braille = translate_char(english).compact # translates individual english letters and returns an array of braille character strings, and removes nil values from characters not set in the dictionary hash
    formatted_braille = formatter(unformatted_braille) # returns one long string of braille characters in formatted braille
    formatted_braille.chars.each_slice(40).map(&:join) # returns one array of braille characters in strings of 80 character length
  end
end
