require "./lib/dictionary"

class BrailleTranslator

  def english_to_braille
    Dictionary.new.english_to_braille
  end

  def translate_letter(letter)
    english_to_braille[letter]
  end

  def translate(english)
    braille_letters = []
    english.chars.each do |letter|
      braille_letters << translate_letter(letter)
    end
    braille_letters
  end
end
