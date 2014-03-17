require_relative '../spec_helper'
require_relative '../constants'

describe LCD::OptionsParser, ".options" do
  subject { described_class }

  before(:all) { ARGV.shift }

  context "when '12' is passed" do
    before { ARGV << '12' }

    its(:options) { should == { number: '12', size: 2 } }
  end

  context "when '03' is passed and size '1' is passed" do
    before { ARGV += %w(-s 1 03) }

    its(:options) { should == { number: '03', size: 1 } }
  end
end
