require_relative '../spec_helper'
require_relative '../constants'

describe LCD::ARGVParser, ".options" do
  subject { described_class }

  before(:all) { ARGV.shift }

  context "when '12' is passed" do
    before { ARGV << '12' }

    its(:options) { should == { number: '12', size: 2 } }
  end

  context "when '03' is passed and size '1' is passed" do
    before do
      ARGV << '-s'
      ARGV << '1'
      ARGV << '03'
    end

    its(:options) { should == { number: '03', size: 1 } }
  end
end
