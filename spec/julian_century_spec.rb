require 'spec_helper'

describe "Julian" do
	it "should calculate julian century from date" do
		expect(SolCal::Julian.century_from(Date.new(2014,12,1),-7)).to be_within(0.0001).of(0.14912526)
	end
end
