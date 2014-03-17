require_relative '../spec_helper'
require_relative '../constants'

describe LCD::DisplayBuilder, '#lcd_numbers' do
  subject { described_class.new(args) }

  shared_examples "lcd number" do |number, size, comparison|
    context "when the number is #{number} and size is #{size}" do
      let(:args) { { number: number, size: size } }

      it "generates the #{number} lcd number" do
        expect(subject.lcd_numbers).to eq(comparison)
      end

    end
  end

  it_behaves_like "lcd number", '0', 1, ZERO_SIZE_1
  it_behaves_like "lcd number", '1', 1, ONE_SIZE_1
  it_behaves_like "lcd number", '2', 1, TWO_SIZE_1
  it_behaves_like "lcd number", '3', 1, THREE_SIZE_1
  it_behaves_like "lcd number", '4', 1, FOUR_SIZE_1
  it_behaves_like "lcd number", '5', 1, FIVE_SIZE_1
  it_behaves_like "lcd number", '6', 1, SIX_SIZE_1
  it_behaves_like "lcd number", '7', 1, SEVEN_SIZE_1
  it_behaves_like "lcd number", '8', 1, EIGHT_SIZE_1
  it_behaves_like "lcd number", '9', 1, NINE_SIZE_1
  it_behaves_like "lcd number", '123456789', 1, LONG_SIZE_1
  it_behaves_like "lcd number", '0', 2, ZERO_SIZE_2
  it_behaves_like "lcd number", '123456789', 2, LONG_SIZE_2
end

describe LCD::DisplayBuilder, '#respond_to?' do
  let(:args) { { number: '0', size: 1 } }

  subject { described_class.new(args) }

  it "responds to 'lcd_numbers'" do
    expect(subject.respond_to?(:lcd_numbers)).to be_true
  end

  it "responds to 'top_line'" do
    expect(subject.respond_to?(:top_line)).to be_true
  end

  it "does not respond to 'not_existing_method'" do
    expect(subject.respond_to?(:not_existing_method)).to be_false
  end
end
