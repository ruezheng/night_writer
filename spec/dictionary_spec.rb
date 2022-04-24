require 'simplecov'
SimpleCov.start
require './lib/dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  describe ".english_to_braille" do
    it "turns english letters into braille" do
      expect(dictionary.english_to_braille["a"]).to eq("0.....")
      expect(dictionary.english_to_braille["b"]).to eq("0.0...")
      expect(dictionary.english_to_braille["c"]).to eq("00....")
      expect(dictionary.english_to_braille["z"]).to eq("0..000")
      expect(dictionary.english_to_braille[" "]).to eq("......")
    end
  end

  describe ".braille_to_english" do
    it "turns braille into english letters" do
      expect(dictionary.braille_to_english["0....."]).to eq("a")
      expect(dictionary.braille_to_english["0.0..."]).to eq("b")
      expect(dictionary.braille_to_english["00...."]).to eq("c")
      expect(dictionary.braille_to_english["0..000"]).to eq("z")
      expect(dictionary.braille_to_english["......"]).to eq(" ")
    end
  end
end
