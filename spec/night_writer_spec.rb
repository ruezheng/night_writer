require './lib/night_writer'

describe NightWriter do
  let(:night_writer) { NightWriter.new }


  it "exists" do
    expect(night_writer).to be_a NightWriter
  end

  it "has attributes that initialize night_writer.rb" do
    expect(night_writer.file).to eq('This is where we will put english words to translate into braille.')
  end
end
