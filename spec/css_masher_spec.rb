require File.dirname(__FILE__) + '/spec_helper.rb'

describe CssMasher do

  it "should have an initializer" do
    CssMasher.new
  end

  it "should allow the adding of blocks of css" do
    css = CssMasher.new

    css.add_block('this is { valid: css }')
  end

  describe "parser" do
    before(:each) { @css = CssMasher.new }

    it "should produce a hash from simple css blocks" do
      CssMasher::Parser.should_receive(:parse!).with('this css').and_return({:la=>:la})

      @css.add_block('this css')

      @css.to_hash.should == {:la=>:la}
    end
  end

end
