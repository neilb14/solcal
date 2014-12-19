require 'spec_helper'

describe "Sun" do
	before :each do
		@latitude = SolCal::Angle.from_deg(53.5333)
		@longitude = SolCal::Angle.from_deg(-113.5)
	end

	it "should calculate the interesting daylight information for edmonton" do
		daylight = SolCal::Sun.daylight(@latitude, @longitude, -7, Date.new(2014,12,1))
		expect(daylight[:sunrise].to_s).to eql("08:27")
		expect(daylight[:sunset].to_s).to eql("16:18")
		expect(daylight[:duration]).to be_within(1).of(472.16513)
	end

	it "should calculate daylight information in Edmonton on winter solstice" do
		solstice = SolCal::Sun.daylight(@latitude, @longitude, -7, Date.new(2014,12,21))
		expect(solstice[:sunrise].to_s).to eql("08:48")
		expect(solstice[:sunset].to_s).to eql("16:15")
	end

	it "should calculate daylight information in Edmonton on summer solstice" do
		solstice = SolCal::Sun.daylight(@latitude, @longitude, -6, Date.new(2014,6,21))
		expect(solstice[:sunrise].to_s).to eql("05:04")
		expect(solstice[:sunset].to_s).to eql("22:07")
	end

	it "should calculate daylight information in Miami on winter solstice" do
		solstice = SolCal::Sun.daylight(SolCal::Angle.from_deg(25.7877), SolCal::Angle.from_deg(-80.2241), -5, Date.new(2014,12,21))
		expect(solstice[:sunrise].to_s).to eql("07:03")
		expect(solstice[:sunset].to_s).to eql("17:34")
	end

	it "should calculate daylight information in Miami on summer solstice" do
		solstice = SolCal::Sun.daylight(SolCal::Angle.from_deg(25.7877), SolCal::Angle.from_deg(-80.2241), -4, Date.new(2014,6,21))
		expect(solstice[:sunrise].to_s).to eql("06:30")
		expect(solstice[:sunset].to_s).to eql("20:15")
	end


	it "should calculate daylight information in Sydney on winter solstice" do
		solstice = SolCal::Sun.daylight(SolCal::Angle.from_deg(-33.86), SolCal::Angle.from_deg(151.2094), +11, Date.new(2014,12,21))
		expect(solstice[:sunrise].to_s).to eql("05:41")
		expect(solstice[:sunset].to_s).to eql("20:05")
	end

	it "should calculate daylight information in Sydney on summer solstice" do
		solstice = SolCal::Sun.daylight(SolCal::Angle.from_deg(-33.86), SolCal::Angle.from_deg(151.2094), +10, Date.new(2014,6,21))
		expect(solstice[:sunrise].to_s).to eql("07:00")
		expect(solstice[:sunset].to_s).to eql("16:53")
	end
end
