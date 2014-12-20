require 'spec_helper'

describe "Location" do
	before :each do
		@edmonton = SolCal::Location.new(53.5333, -113.5)
		@miami = SolCal::Location.new(25.7877, -80.2241)
		@sydney = SolCal::Location.new(-33.86, 151.2094)
	end

	it "should calculate the sunrise for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({sunrise:SolCal::TimeOfDay.new(0.25)})
		expect(@edmonton.sunrise(Date.new(2014,12,21),-7).to_s).to eql("06:00")
	end

	it "should calculate the sunset for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({sunset:SolCal::TimeOfDay.new(0.75)})
		expect(@edmonton.sunset(Date.new(2014,12,21),-7).to_s).to eql("18:00")
	end

	it "should calculate the duration of sunlight for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({duration:500})
		expect(@edmonton.duration(Date.new(2014,12,21),-7)).to eql(500)
	end

	it "should calculate daylight information for edmonton" do
		results = @edmonton.daylight(Date.new(2014,12,1),-7)
		expect(results[:sunrise].to_s).to eql("08:27")
		expect(results[:sunset].to_s).to eql("16:18")
		expect(results[:duration]).to be_within(1).of(472.16513)
	end

	it "should calculate daylight information in Edmonton on winter solstice" do
		results = @edmonton.daylight(Date.new(2014,12,21),-7)
		expect(results[:sunrise].to_s).to eql("08:48")
		expect(results[:sunset].to_s).to eql("16:15")
	end

	it "should calculate daylight information in Edmonton on summer solstice" do
		results = @edmonton.daylight(Date.new(2014,6,21),-6)
		expect(results[:sunrise].to_s).to eql("05:04")
		expect(results[:sunset].to_s).to eql("22:07")
	end

	it "should calculate daylight information in Miami on winter solstice" do
		results = @miami.daylight(Date.new(2014,12,21),-5)
		expect(results[:sunrise].to_s).to eql("07:03")
		expect(results[:sunset].to_s).to eql("17:34")
	end

	it "should calculate daylight information in Miami on summer solstice" do
		results = @miami.daylight(Date.new(2014,6,21),-4)
		expect(results[:sunrise].to_s).to eql("06:30")
		expect(results[:sunset].to_s).to eql("20:15")
	end

	it "should calculate daylight information in Sydney on winter solstice" do
		results = @sydney.daylight(Date.new(2014,12,21),+11)
		expect(results[:sunrise].to_s).to eql("05:41")
		expect(results[:sunset].to_s).to eql("20:05")
	end

	it "should calculate daylight information in Sydney on summer solstice" do
		results = @sydney.daylight(Date.new(2014,6,21),+10)
		expect(results[:sunrise].to_s).to eql("07:00")
		expect(results[:sunset].to_s).to eql("16:53")
	end
end

