require 'spec_helper'

describe "JulianCenturyCommand" do
	before :each do
		@results = {date:Date.new(2014,12,1), time_zone: -7}
		@command = SolCal::Commands::JulianCenturyCommand.new(@results)
	end

	it "should calculate julian century from date" do
		@command.execute
		expect(@results[:julian_century]).not_to be_nil
		expect(@results[:julian_century]).to be_within(0.0001).of(0.14912526)
	end
end
