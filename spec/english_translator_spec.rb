require "./lib/english_translator"

describe EnglishTranslator do
  let(:english_translator) { EnglishTranslator.new }

  describe ".translate_letter" do
    it "can print a specified braille letter from a-z" do
      expect(english_translator.translate_letter("0.....").to eq("a"))
      expect(english_translator.translate_letter("0.0...").to eq("b"))
      expect(english_translator.translate_letter("0.000.").to eq("r"))
      expect(english_translator.translate_letter("0..000").to eq("z"))
      expect(english_translator.translate_letter("......").to eq(" "))
    end
  end

  describe ".translate" do
    it "translates mumltiple english letters to braille" do
      expect(english_translator.translate(["0.....", "0.0...", "00...."]).to eq("abc"))
      expect(english_translator.translate(["0....."]).to eq("a"))
    end
  end

  describe ".formatter" do
    it "formats braille letters into printable form" do
      expect(english_translator.formatter("0.0.00\n..0...\n......").to eq(["0.....", "0.0...", "00...."]))
      expect(english_translator.formatter("0.\n..\n..").to eq(["0....."]))
    end
  end
end
