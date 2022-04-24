require 'simplecov'
SimpleCov.start
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

  describe ".translate_char" do
    it "translates mumltiple english letters to braille" do
      expect(braille_translator.translate_char("abc")).to eq(["0.....", "0.0...", "00...."])
      expect(braille_translator.translate_char("a")).to eq(["0....."])
      expect(braille_translator.translate_char("abcdefghijklmnopqrstuvwxyz ")).to eq(["0.....", "0.0...", "00....", "00.0..", "0..0..", "000...", "0000..", "0.00..", ".00...", ".000..", "0...0.", "0.0.0.", "00..0.", "00.00.", "0..00.", "000.0.", "00000.", "0.000.", ".00.0.", ".0000.", "0...00", "0.0.00", ".000.0", "00..00", "00.000", "0..000", "......"])
    end
  end

  describe ".formatter" do
    it "formats braille letters into printable form" do
      expect(braille_translator.formatter(["0.....", "0.0...", "00...."])).to eq("0.0.00\n..0...\n......")
      expect(braille_translator.formatter(["0....."])).to eq("0.\n..\n..")
    end
  end

  describe ".translator" do
    it "messages of more than 80 characters are split over multiple lines (translates 41 english lowercase letters, 82 positions wide)" do
      expect(braille_translator.translator("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).to eq( ["0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.", "0.\n.....................................", "........................................", ".....\n..................................", "........................................", "........"])
    end
  end
end
