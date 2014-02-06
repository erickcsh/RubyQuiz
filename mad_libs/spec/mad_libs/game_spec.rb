require 'mad_libs'
require 'constants'

describe MadLibs::Game, "#play" do
  let(:console) { double(:console).as_null_object }

  context "when message is not substitutable" do
    subject { described_class.new(NOT_SUBSTITUTABLE, console)}

    its(:play) { should == NOT_SUBSTITUTABLE }
  end

  context "when there is one substitution" do
    subject { described_class.new(SUBSTITUTE_1, console) }

    before { allow(console).to receive(:ask_substitution) { A_GEM } }

    its(:play) { should == SUBSTITUTE_1_SUBSTITUTED }
  end

  context "when there is more than one substitution" do
    context "when there is a repetition" do
      subject { described_class.new(SUBSTITUTE_2, console) }

      before { allow(console).to receive(:ask_substitution).once { A_GEM } }

      its(:play) { should == SUBSTITUTE_2_SUBSTITUTED }
    end

    context "when there are 3 same inputs but only 2 repeated" do
      subject { described_class.new(SUBSTITUTE_3, console) }

      before { allow(console).to receive(:ask_substitution).and_return(A_GEM, OTHER_GEM) }

      its(:play) { should == SUBSTITUTE_3_SUBSTITUTED }
    end
  end
end
