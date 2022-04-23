require './lib/dictionary'

describe Dictionary do
  let(:dictionary) {Dictionary.new}

  it "exists" do
    expect(dictionary).to be_a Dictionary
  end

  it "has attributes" do
    expect(dictionary.letters_hash[:a][0]).to eq('0.')
    expect(dictionary.letters_hash[:a]).to eq ['0.', '..', '..']
  end

  it "can print a specified braille letter" do
    expect(dictionary.print_braille(:a)).to eq("0.\n..\n..")
  end
end
