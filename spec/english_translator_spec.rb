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

  describe ".translate" do
    it "translates mumltiple braille letters to english" do
      expect(english_translator.translate("0.0.00\n..0...\n......")).to eq("abc")
      expect(english_translator.translate(["0....."])).to eq("a")
    end
  end
end
