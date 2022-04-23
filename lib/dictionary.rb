class Dictionary
  attr_reader :letters_hash

  def initialize
    @letters_hash = {
      a: %w[0. .. ..],
      b: %w[0. 0. ..],
      c: %w[00 .. ..]
    }
  end

  def print_braille(letter)
    braille = ""
    @letters_hash.each do |key, value|
      if letter == key
        row0 = value[0]
        row1 = value[1]
        row2 = value[2]
        braille = "#{row0}\n" + "#{row1}\n" + "#{row2}"
      end
    end
    braille
  end
end
