class Dictionary
  attr_reader :letters_hash

  def initialize
    @letters_hash = {
      a: %w[0. .. ..],
      b: %w[0. 0. ..],
      c: %w[00 .. ..]
    }
  end

  def row1
    puts @letters_hash[:a][0]
    puts @letters_hash[:a][1]
    puts @letters_hash[:a][2]
  end
  # value[1].delete("")
  # value[2].delete("")
end
