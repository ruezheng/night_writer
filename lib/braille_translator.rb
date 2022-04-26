require "./lib/dictionary"

class BrailleTranslator

  def english_to_braille
    Dictionary.new.english_to_braille
  end

  def translate_letter(letter)
    english_to_braille[letter]
  end

  def translate_english(english)
    braille_letter = []
    english.chars.each do |letter|
      braille_letter << translate_letter(letter)
    end
    braille_letter
  end

  def formatter(braille)
    top_row = ""
    middle_row = ""
    bottom_row = ""
    braille.each do |braille_letter|
      top_row += braille_letter[0..1]
      middle_row += braille_letter[2..3]
      bottom_row += braille_letter[4..5]
    end
    [top_row, middle_row, bottom_row].join("\n")
  end

  def translator(english_message)
    english = english_message.delete("\n")
    unformatted_braille = translate_english(english).compact
    formatted_braille = formatter(unformatted_braille)
    formatted_braille.chars.each_slice(80).map(&:join).join("\n")
  end
end
