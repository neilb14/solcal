require 'spec_helper'

describe "DatePair" do
	before :each do
		@edmonton = SolCal::Location.new(53.5333, -113.5)
	end

	it "should calculate the date pair for January 14 in Edmonton" do
		expect(@edmonton.date_pair(2015,01,14,-7)[:date]).to eql(Date.new(2015,11,28))
		expect(@edmonton.date_pair(2015,01,15,-7)[:date]).to eql(Date.new(2015,11,27))
	end

	it "should calculate the date pair for winter solstice in Edmonton" do
		expect(@edmonton.date_pair(2014,12,21,-7)[:date]).to eql(Date.new(2014,12,22))
	end

end

