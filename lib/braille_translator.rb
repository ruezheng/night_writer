require "./lib/dictionary"

class BrailleTranslator

  def english_to_braille
    Dictionary.new.english_to_braille
  end

  def translate(letter)
    english_to_braille[letter]
  end
end


# class BrailleTranslator
#
#   def english_to_braille
#     Dictionary.new.english_to_braille
#   end
#
#   def translate(letter)
#     braille = ""
#     english_to_braille.each do |key, value|
#       if letter == key
#         row0 = value[0]
#         row1 = value[1]
#         row2 = value[2]
#         braille = "#{row0}\n" + "#{row1}\n" + "#{row2}"
#       end
#     end
#     braille
#   end
# end
