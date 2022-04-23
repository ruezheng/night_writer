class Dictionary
  attr_reader :letters_hash

  def initialize
    @letters_hash = {
      "a" => %w[0. .. ..],
      "b" => %w[0. 0. ..],
      "c" => %w[00 .. ..],
      "d" => %w[00 .0 ..],
      "e" => %w[0. .0 ..],
      "f" => %w[00 0. ..],
      "g" => %w[00 00 ..],
      "h" => %w[0. 00 ..],
      "i" => %w[.0 0. ..],
      "j" => %w[.0 00 ..],
      "k" => %w[0. .. 0.],
      "l" => %w[0. 0. 0.],
      "m" => %w[00 .. 0.],
      "n" => %w[00 .0 0.],
      "o" => %w[0. .0 0.],
      "p" => %w[00 0. 0.],
      "q" => %w[00 00 0.],
      "r" => %w[0. 00 0.],
      "s" => %w[.0 0. 0.],
      "t" => %w[.0 00 0.],
      "u" => %w[0. .. 00],
      "v" => %w[0. 0. 00],
      "w" => %w[.0 00 .0],
      "x" => %w[00 .. 00],
      "y" => %w[00 .0 00],
      "z" => %w[0. .0 00],
      " " => %w[.. .. ..]
    }
  end

  def print_braille(letter)
    braille = "" # used .each ennumerable to return a string instead of an array
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
