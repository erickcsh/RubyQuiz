require 'mad_libs'
require 'constants'

describe MadLibs::Game, "#play" do

  before { allow(STDOUT).to receive(:puts) }

  context "when message is not substitutable" do
    subject { described_class.new(NOT_SUBSTITUTABLE)}

    its(:play) { should == NOT_SUBSTITUTABLE }
  end

  context "when there is one substitution" do
    subject { described_class.new(SUBSTITUTE_1) }

    before { allow(STDIN).to receive(:gets) {"#{A_GEM}\n" } }

    its(:play) { should == SUBSTITUTE_1_SUBSTITUTED }
  end

  context "when there is more than one substitution" do
    context "when there is a repetition" do
      subject { described_class.new(SUBSTITUTE_2) }

      before { allow(STDIN).to receive(:gets).once {"#{A_GEM}\n" } }

      its(:play) { should == SUBSTITUTE_2_SUBSTITUTED }
    end

    context "when there are 3 same inputs but only 2 repeated" do
      subject { described_class.new(SUBSTITUTE_3) }

      before { allow(STDIN).to receive(:gets).and_return("#{A_GEM}\n", "#{OTHER_GEM}\n") }

      its(:play) { should == SUBSTITUTE_3_SUBSTITUTED }
    end
  end
end
