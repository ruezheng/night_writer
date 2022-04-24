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

  def formatter(braille)
    row1 = "#"
    row2 = "#"
    row3 = "#"
    braille.each do |braille_letter|
      row1 += braille_letter[0..1]
      row2 += braille_letter[2..3]
      row3 += braille_letter[4..5]
    end
    [row1, row2, row3].join("\n").delete("#")
  end
end
