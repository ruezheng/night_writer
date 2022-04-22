require './lib/night_writer'

describe Braille do
  let(:braille) {Braille.new}

  it "exists" do
    expect(braille).to be_a Braille
  end

  it "has attributes" do
    expect(braille.letters('h')).to eq(
      '0.
      00
      ..')
  end
end
