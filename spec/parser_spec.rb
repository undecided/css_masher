require File.dirname(__FILE__) + '/spec_helper.rb'

describe CssMasher::Parser do
  it "should identify a selector" do
    hash = CssMasher::Parser.parse!('its { very: simple }')

    hash[:its].should_not be_nil
  end

  it "should identify attribute pairs" do
    hash = CssMasher::Parser.parse!('its { very: simple }')

    hash.should == {:its => {:very => 'simple'}}
  end

  it "should handle multiple attributes" do
    hash = CssMasher::Parser.parse!('its {not : quite; so: simple now "is it"!}')

    hash.should == {:its => {:not => 'quite', :so => 'simple now "is it"!'}}
  end
end
