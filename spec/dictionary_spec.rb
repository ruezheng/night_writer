require './lib/night_writer'
require './lib/dictionary'

describe Dictionary do
  let(:dictionary) {Dictionary.new}

  it "exists" do
    expect(dictionary).to be_a Dictionary
  end

  it "has attributes" do
    expect(dictionary.letters).to eq({:a => ['0.', '..', '..']})
  end

  it "can print letters" do
    expect(dictionary.print_letters(a)).to eq ['0.', '..', '..']
  end
end
