require "./lib/braille_translator"

describe BrailleTranslator do
  let(:braille_translator) { BrailleTranslator.new }

  describe ".translate_letter" do
    it "can print a specified braille letter from a-z" do
      expect(braille_translator.translate_letter("a")).to eq("0.....")
      expect(braille_translator.translate_letter("b")).to eq("0.0...")
      expect(braille_translator.translate_letter("r")).to eq("0.000.")
      expect(braille_translator.translate_letter("z")).to eq("0..000")
      expect(braille_translator.translate_letter(" ")).to eq("......")
    end
  end

  describe ".translate" do
    it "translates mumltiple english letters to braille" do
      expect(braille_translator.translate_char("abc")).to eq(["0.....", "0.0...", "00...."])
      expect(braille_translator.translate_char("a")).to eq(["0....."])
    end
  end

  describe ".formatter" do
    it "formats braille letters into printable form" do
      expect(braille_translator.formatter(["0.....", "0.0...", "00...."])).to eq("0.0.00\n..0...\n......")
      expect(braille_translator.formatter(["0....."])).to eq("0.\n..\n..")
    end
  end

  describe ".translator" do
    it "returns one array of braille characters translated from english in strings of 80 character length" do
      expect(braille_translator.translator("zero is a beautiful number not because it is round and cute rather it is the ultimate foundation to build anything upon")).to eq( ["0.0.0.0....0.0..0...0.0.0.0..0.0000.0...000.000.0.0...000..0..0.0.000.0..00....0",
       ".0...0.0..0.0.0.0000..0.0000..000..00...0.0..00.0.0....0.0...0.0...00.0...0.0..0",
       ".0000..00...000.0.00000..0.00.00...00...0.0..00.00..0.0000.00..00000..0.000.00\n.",
       "0.000.0..0.0.......0..0....000.0...0....0....0..000...0.000..0..0......0..0..0.0",
       "0..0.0...00.0...0.0.....0.0......00.0..00..0000.000..0.00..0.0...0000.0....0.000",
       ".....00.0..0..0...0.0..000..0.0..00.0..0...0.0..0.....0.000000..000....0..0.0\n00",
       "..0.0.....0.............000.....000...0.000.....0...0.0.0...........000.......0.",
       "....0...0.0.000.......0.......000.....0...0.....0.....0.....0...0.......000.0...",
       "0...0.......0.000.....0...0.0...0.0.....00..0.......0.000.....0.....000.0.0."])
    end
  end
end
