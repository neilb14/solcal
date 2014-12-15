require 'spec_helper'

describe "JulianCenturyCommand" do
	before :each do
		@command = SolCal::Commands::JulianCenturyCommand.new({date:Date.new(2014,12,1), time_zone: -7})
	end

	it "should calculate julian century from date" do
		@command.execute
		expect(@command.result).to be_within(0.0001).of(0.14912526)
	end
end
