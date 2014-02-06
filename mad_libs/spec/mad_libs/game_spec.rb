require 'mad_libs'

describe MadLibs::Game, "#play" do

  context "when message is not substitutable" do
    subject { described_class.new("Not substitutable") }

    its(:play) { should eq("Not substitutable") }
  end
end
