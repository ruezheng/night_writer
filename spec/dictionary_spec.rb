require './lib/dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  it "has letters" do
    expect(dictionary.english_to_braille["a"]).to eq("0.....")
    expect(dictionary.english_to_braille["b"]).to eq("0.0...")
    expect(dictionary.english_to_braille["c"]).to eq("00....")
    expect(dictionary.english_to_braille["z"]).to eq("0..000")
    expect(dictionary.english_to_braille[" "]).to eq("......")
  end
end
