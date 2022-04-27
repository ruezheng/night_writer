require "./lib/dictionary"

class EnglishTranslator

  def braille_to_english
    Dictionary.new.braille_to_english
  end

  def translate_letter(letter)
    braille_to_english[letter]
  end

  def split_braille_array(braille)
    string = braille.delete("\n")
    break_length = ( string.length / 3 )
    string.chars.each_slice(break_length).map(&:join)
  end

  def translate_braille(braille)
    english_letters = []
    braille.each do |braille_letter|
      english_letters << translate_letter(braille_letter)
    end
    english_letters.join
  end

  def revert_to_braille_letters(braille)
    english = ""
    braille.each_slice(3) do |braille_row|
      arr = []
      top_row = braille_row[0].chars.each_slice(2).map(&:join)
      middle_row = braille_row[1].chars.each_slice(2).map(&:join)
      bottom_row = braille_row[2].chars.each_slice(2).map(&:join)
      top_row.each_with_index do |two_chars, index|
        arr << [two_chars, middle_row[index], bottom_row[index]]
      end
      english += translate_braille(arr.map(&:join))
    end
    english
  end

  def reverse_translator(braille_message)
    braille = split_braille_array(braille_message)
    english = revert_to_braille_letters(braille)
    english.chars.each_slice(40).map(&:join).join
  end
end
