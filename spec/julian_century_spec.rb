require 'spec_helper'

describe "Julian" do
	it "should calculate julian century from julian date" do
		expect(SolCal::Julian.century_from(2456991.80)).to be_within(0.00000001).of(0.14912526)
	end
end
