require File.dirname(__FILE__) + '/spec_helper.rb'

describe CssMasher::Parser do
  it "should identify a selector" do
    hash = CssMasher::Parser.parse!('its { very: simple }')

    hash[:its].should_not be_nil
  end

  xit "should do something" do
     {:its => {:very => 'simple'}}
  end
end
