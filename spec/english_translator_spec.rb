require 'simplecov'
SimpleCov.start
require "./lib/english_translator"

describe EnglishTranslator do
  let(:english_translator) { EnglishTranslator.new }

  describe ".translate_letter" do
    it "can translate specified braille letters to english" do
      expect(english_translator.translate_letter("0.....")).to eq("a")
      expect(english_translator.translate_letter("0.0...")).to eq("b")
      expect(english_translator.translate_letter("0.000.")).to eq("r")
      expect(english_translator.translate_letter("0..000")).to eq("z")
      expect(english_translator.translate_letter("......")).to eq(" ")
    end
  end

  describe ".split_braille_array" do
    it "removes `\n` and splits every 6 characters into a seperate string" do
      expect(english_translator.split_braille_array("0.0.00\n..0...\n......")).to eq(["0.0.00", "..0...", "......"]) # => "abc"
    end

    it "splits multiple lines to braille" do
      expect(english_translator.split_braille_array("0.000....0.00....00.0.0.0.\n.0.0.0..0000.0..000000.0.0\n0.0.....0..00...0...0.....")).to eq(["0.000....0.00....00.0.0.0.", ".0.0.0..0000.0..000000.0.0", "0.0.....0..00...0...0....."]) # "one two three"
    end
  end

  describe ".revert_to_braille_letters" do
    it "reverts mixed characters back to braille letters" do
      expect(english_translator.revert_to_braille_letters(["0.0.00", "..0...", "......"])).to eq(["0.....", "0.0...", "00...."])
    end
  end

  describe ".translate_braille" do
    it "translates multiple braille letters to english" do
      expect(english_translator.translate_braille(["0.....", "0.0...", "00...."])).to eq("abc")
    end
  end

  describe ".reverse_translator" do
    xit "translates multiple braille letters to english" do
      expect(english_translator.reverse_translator("0.0.00\n..0...\n......")).to eq("abc")
    end


    it "splits messages of more than 80 characters are over multiple lines (translates 41 braille letters into lowercase english letters" do
      expect(english_translator.reverse_translator("0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n..................................................................................\n..................................................................................")).to eq("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    end
  end
end
