require "./lib/braille_translator"

describe BrailleTranslator do
  let(:braille_translator) { BrailleTranslator.new }

  describe '.translate' do
    it "can print a specified braille letter from a-z" do
      expect(braille_translator.translate("a")).to eq("0.....")
      expect(braille_translator.translate("b")).to eq("0.0...")
      expect(braille_translator.translate("r")).to eq("0.000.")
      expect(braille_translator.translate("z")).to eq("0..000")
      expect(braille_translator.translate(" ")).to eq("......")
    end
  end
end
