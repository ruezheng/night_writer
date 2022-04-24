require "./lib/braille_translator"

describe Translator do
  let(:braille_translator) { Translator.new }

  describe '.translate_letter' do
    it "can print a specified braille letter from a-z" do
      expect(braille_translator.translate_letter("a")).to eq("0.....")
      expect(braille_translator.translate_letter("b")).to eq("0.0...")
      expect(braille_translator.translate_letter("r")).to eq("0.000.")
      expect(braille_translator.translate_letter("z")).to eq("0..000")
      expect(braille_translator.translate_letter(" ")).to eq("......")
    end
  end

  describe '.translate' do
    it "translates mumltiple english letters to braille" do
      expect(braille_translator.translate('abc')).to eq(["0.....", "0.0...", "00...."])
      expect(braille_translator.translate('a')).to eq(["0....."])
    end
  end

  describe '.formatter' do
    it "formats braille letters into printable form" do
      expect(braille_translator.formatter(["0.....", "0.0...", "00...."])).to eq("0.0.00\n..0...\n......")
      expect(braille_translator.formatter(["0....."])).to eq("0.\n..\n..")
    end
  end
end
