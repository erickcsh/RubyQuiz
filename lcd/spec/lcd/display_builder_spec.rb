require_relative '../spec_helper'
require_relative '../constants'

describe LCD::DisplayBuilder, '#lcd_numbers' do
  subject { described_class.new(args) }

  context "when there is a single number" do
    context "when the number is 0" do
      let(:args) { { number: '0', size: 1 } }

      it "generates the 0 lcd number" do
        expect(subject.lcd_numbers).to eq(ZERO_SIZE_1)
      end
    end

    context "when the number is 1" do
      let(:args) { { number: '1', size: 1 } }

      it "generates the 1 lcd number" do
        expect(subject.lcd_numbers).to eq(ONE_SIZE_1)
      end
    end

    context "when the number is 2" do
      let(:args) { { number: '2', size: 1 } }

      it "generates the 2 lcd number" do
        expect(subject.lcd_numbers).to eq(TWO_SIZE_1)
      end
    end

    context "when the number is 3" do
      let(:args) { { number: '3', size: 1 } }

      it "generates the 3 lcd number" do
        expect(subject.lcd_numbers).to eq(THREE_SIZE_1)
      end
    end

    context "when the number is 4" do
      let(:args) { { number: '4', size: 1 } }

      it "generates the 4 lcd number" do
        expect(subject.lcd_numbers).to eq(FOUR_SIZE_1)
      end
    end

    context "when the number is 5" do
      let(:args) { { number: '5', size: 1 } }

      it "generates the 5 lcd number" do
        expect(subject.lcd_numbers).to eq(FIVE_SIZE_1)
      end
    end

    context "when the number is 6" do
      let(:args) { { number: '6', size: 1 } }

      it "generates the 6 lcd number" do
        expect(subject.lcd_numbers).to eq(SIX_SIZE_1)
      end
    end

    context "when the number is 7" do
      let(:args) { { number: '7', size: 1 } }

      it "generates the 7 lcd number" do
        expect(subject.lcd_numbers).to eq(SEVEN_SIZE_1)
      end
    end

    context "when the number is 8" do
      let(:args) { { number: '8', size: 1 } }

      it "generates the 8 lcd number" do
        expect(subject.lcd_numbers).to eq(EIGHT_SIZE_1)
      end
    end

    context "when the number is 9" do
      let(:args) { { number: '9', size: 1 } }

      it "generates the 9 lcd number" do
        expect(subject.lcd_numbers).to eq(NINE_SIZE_1)
      end
    end
  end
end
