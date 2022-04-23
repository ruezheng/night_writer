require './lib/dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  it "has attributes" do
    # expect(dictionary.english_to_braille.to be_a(Hash)
    expect(dictionary.english_to_braille["a"][0]).to eq('0.')
    expect(dictionary.english_to_braille["a"]).to eq ['0.', '..', '..']
  end

  it "can print a specified braille letter from a-z" do
    expect(dictionary.translate("a")).to eq("0.\n..\n..")
    expect(dictionary.translate("b")).to eq("0.\n0.\n..")
    expect(dictionary.translate("r")).to eq("0.\n00\n0.")
    expect(dictionary.translate("z")).to eq("0.\n.0\n00")
    expect(dictionary.translate(" ")).to eq("..\n..\n..")
  end
end
