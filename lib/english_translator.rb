require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english  # method that creates a new instance of Dictionary class and calls on the braille_to_english hash with braille keys and english letters as values
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter) # returns specified english letter value of braille letter keys
    braille_to_english[letter]
  end




  # def split_braille_array(braille)
  #   require "pry"; binding.pry
  # end
  #
  # def translator(braille_message)
  #   english_message = translate(braille_message)
  #   english_message.chars.each_slice(80).map(&:join)
  # end
end
