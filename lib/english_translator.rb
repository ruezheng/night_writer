require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english  # method that creates a new instance of Dictionary class and calls on the braille_to_english hash with braille keys and english letters as values
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter) # returns specified english letter value of braille letter keys
    braille_to_english[letter]
  end

  def split_braille_array(braille)
    require "pry"; binding.pry

  end

  def translate_braille_char(braille) # iterates through each braille character element in array and returns english values
    english_letters = []
    braille.each do |braille_letter|
      english_letters << translate_letter(braille_letter)
    end
    english_letters
  end

  # def reverse_formatter(braille) # reverses braille format and returns each letter as an element in a single array
  #   top_row = "#"
  #   middle_row = "#"
  #   bottom_row = "#" # placeholder b/c it wouldn't let me add to an empty string
  #   braille.each do |braille_letter|
  #     top_row += braille_letter[0..1]
  #     middle_row += braille_letter[2..3]
  #     bottom_row += braille_letter[4..5]
  #   end
  #   [top_row, middle_row, bottom_row].join("\n").delete("#")
  # end


  # def split_braille_array(braille)
  #   require "pry"; binding.pry
  # end
  #
  # def translator(braille_message)
  #   english_message = translate(braille_message)
  #   english_message.chars.each_slice(80).map(&:join)
  # end
end
