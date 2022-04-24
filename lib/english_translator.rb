require "./lib/dictionary"

class EnglishTranslator
  def english_to_braille
    Dictionary.new.english_to_braille
  end

  def translate_letter(letter)
    english_to_braille[letter]
  end

  def translate(english)
    braille_char = []
    english.chars.each do |letter|
      braille_char << translate_letter(letter)
    end
    braille_char
  end

  def formatter(braille)
    row1 = "#"
    row2 = "#"
    row3 = "#"
    braille.each do |braille_char|
      row1 += braille_char[0..1]
      row2 += braille_char[2..3]
      row3 += braille_char[4..5]
    end
    [row1, row2, row3].join("\n").delete("#")
  end

  def translator(input_message)
    english = input_message.delete("\n")
    unformatted_braille = translate(english)
    formatted_braille = formatter(unformatted_braille)
    formatted_braille.chars.each_slice(80).map(&:join)
  end
end
