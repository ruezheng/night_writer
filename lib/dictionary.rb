class Dictionary
  attr_reader :letters

  def initialize
    @letters = {
      'a': %w[0. .. ..],
    }
  end

  def print_letters(letter)
    @letters.flat_map do |key, value|
      value
    end
  end
end
