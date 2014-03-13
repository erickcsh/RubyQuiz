require_relative '../spec_helper'
require_relative '../constants'

describe LCD::DisplayBuilder, '#lcd_numbers' do
  subject { described_class.new(args) }

  context "when there is a single number" do
    context "when the number is 0" do
      let(:args) { { number: '0', size: 1 } }

      it "generates the lcd number" do
        expect(subject.lcd_numbers).to eq(ZERO_SIZE_1)
      end
    end
  end
end
