require './lib/dictionary'

describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it "exists" do
    expect(dictionary).to be_a Dictionary
  end

  it "has attributes" do
    expect(dictionary.letters_hash["a"][0]).to eq('0.')
    expect(dictionary.letters_hash["a"]).to eq ['0.', '..', '..']
  end

  it "can print a specified braille letter from a-z" do
    expect(dictionary.print_braille("a")).to eq("0.\n..\n..")
    expect(dictionary.print_braille("b")).to eq("0.\n0.\n..")
    expect(dictionary.print_braille("r")).to eq("0.\n00\n0.")
    expect(dictionary.print_braille("z")).to eq("0.\n.0\n00")
    expect(dictionary.print_braille(" ")).to eq("..\n..\n..")
  end
end
