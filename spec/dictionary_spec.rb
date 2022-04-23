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

  it "can print braille letters" do
    expect(dictionary.row1).to eq(nil)
  end
end
