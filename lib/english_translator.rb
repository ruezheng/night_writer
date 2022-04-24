require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter)
    braille_to_english[letter]
  end

  def split_braille_letters
    unformatted_braille = braille.split("\n") # => ["0.0.00", "..0...", "......"]
  end

  def braille_to_array
    row1 = "#"
    row2 = "#"
    row3 = "#"
    braille.each do |braille_letter|
      row1 += braille_letter[0..1]
      row2 += braille_letter[2..3]
      row3 += braille_letter[4..5]
    end
      require "pry"; binding.pry
    [row1, row2, row3].join("\n").delete("#")
  end

  def translator(braille)
    english_message = translate(braille)
    english_message.chars.each_slice(80).map(&:join)
  end
end
