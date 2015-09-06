require 'spec_helper'

describe "JulianCenturyCommand" do
	before :each do
		@results = {time_zone: -7}
	end

	it "should calculate julian century from 2014-12-01" do
		@results[:date] = Date.new(2014,12,1)
		SolCal::Commands::JulianCenturyCommand.new(@results).execute
		expect(@results[:julian_century]).not_to be_nil
		expect(@results[:julian_century]).to be_within(0.0001).of(0.14912526)
	end

	it "should calculate julian century from 2015-08-05" do
		@results[:date] = Date.new(2015,8,5)
		SolCal::Commands::JulianCenturyCommand.new(@results).execute
		expect(@results[:julian_century]).not_to be_nil
		expect(@results[:julian_century]).to be_within(0.0000001).of(0.15592060232717317)
	end

	it "should calculate julian century from 2015-12-21" do
		@results[:date] = Date.new(2015,12,21)
		SolCal::Commands::JulianCenturyCommand.new(@results).execute
		expect(@results[:julian_century]).to be_within(0.0000001).of(0.15969883641341548)
	end
end
