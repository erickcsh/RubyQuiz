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

  context "when there are more than one substitutions" do
    
  end
end
