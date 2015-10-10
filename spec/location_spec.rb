require 'spec_helper'

describe "Location" do
	before :each do
		@edmonton = SolCal::Location.new(53.5333, -113.5)
		@miami = SolCal::Location.new(25.7877, -80.2241)
		@sydney = SolCal::Location.new(-33.86, 151.2094)
	end

	it "should calculate the sunrise for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({sunrise:SolCal::TimeOfDay.new(0.25)})
		expect(@edmonton.sunrise(2014,12,21,-7)[:sunrise].to_s).to eql("06:00")
	end

	it "should calculate the sunset for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({sunset:SolCal::TimeOfDay.new(0.75)})
		expect(@edmonton.sunset(2014,12,21,-7)[:sunset].to_s).to eql("18:00")
	end

	it "should calculate the duration of sunlight for an arbitrary day in Edmonton" do
		expect(SolCal::Commands).to receive(:run).and_return({duration:500})
		expect(@edmonton.duration(2014,12,21,-7)[:duration]).to eql(500)
	end

	it "should calculate daylight information for edmonton" do
		results = @edmonton.daylight(2014,12,1,-7)
		expect(results[:sunrise].to_s).to eql("08:27")
		expect(results[:sunset].to_s).to eql("16:18")
		expect(results[:duration]).to be_within(1).of(472.16513)
		expect(results[:civil_dawn].to_s).to eql("07:45")
		expect(results[:civil_dusk].to_s).to eql("17:00")
	end

	it "should calculate daylight information in Edmonton on winter solstice" do
		results = @edmonton.daylight(2014,12,21,-7)
		expect(results[:sunrise].to_s).to eql("08:48")
		expect(results[:sunset].to_s).to eql("16:15")
		expect(results[:civil_dawn].to_s).to eql("08:05")
		expect(results[:civil_dusk].to_s).to eql("16:59")
	end

	it "should calculate daylight information in Edmonton on summer solstice" do
		results = @edmonton.daylight(2014,6,21,-6)
		expect(results[:sunrise].to_s).to eql("05:04")
		expect(results[:sunset].to_s).to eql("22:07")
		expect(results[:civil_dawn].to_s).to eql("04:11")
		expect(results[:civil_dusk].to_s).to eql("23:00")
	end

	it "should calculate daylight information in Miami on winter solstice" do
		results = @miami.daylight(2014,12,21,-5)
		expect(results[:sunrise].to_s).to eql("07:03")
		expect(results[:sunset].to_s).to eql("17:34")
		expect(results[:civil_dawn].to_s).to eql("06:37")
		expect(results[:civil_dusk].to_s).to eql("17:59")
	end

	it "should calculate daylight information in Miami on summer solstice" do
		results = @miami.daylight(2014,6,21,-4)
		expect(results[:sunrise].to_s).to eql("06:30")
		expect(results[:sunset].to_s).to eql("20:15")
		expect(results[:civil_dawn].to_s).to eql("06:04") 
		expect(results[:civil_dusk].to_s).to eql("20:41") 
	end

	it "should calculate daylight information in Sydney on winter solstice" do
		results = @sydney.daylight(2014,12,21,+11)
		expect(results[:sunrise].to_s).to eql("05:41")
		expect(results[:sunset].to_s).to eql("20:05")
		expect(results[:civil_dawn].to_s).to eql("05:11") 
		expect(results[:civil_dusk].to_s).to eql("20:34") 
	end

	it "should calculate daylight information in Sydney on summer solstice" do
		results = @sydney.daylight(2014,6,21,+10)
		expect(results[:sunrise].to_s).to eql("07:00")
		expect(results[:sunset].to_s).to eql("16:53")
		expect(results[:civil_dawn].to_s).to eql("06:32") 
		expect(results[:civil_dusk].to_s).to eql("17:21") 
	end

	it "should calculate time to 70deg from zenith on 2015-09-06 in Edmonton" do
		results = @edmonton.time_to_angle_from_zenith(2015, 9, 6, -6, 70)
		expect(results[:time_to_angle_from_zenith].to_s).to eql("09:13")
	end

	it "should calculate angle to zenith of 70deg at 9:13 on 2015-09-06 in Edmonton" do
		results = @edmonton.angle_to_zenith_at_time(2015, 9, 6, 9, 13, -6)
		expect(results[:angle_to_zenith_at_time].to_deg).to be_within(0.1).of(70)
	end

	it "should calculate time to 70deg from zenith on 2015-09-06 in Miami" do
		results = @miami.time_to_angle_from_zenith(2015, 9, 6, -4, 70)
		expect(results[:time_to_angle_from_zenith].to_s).to eql("08:35")
		expect(results[:opposite_time_to_angle_from_zenith].to_s).to eql("18:02")
	end

	it "should calculate angle from zenith of 70deg at 8:35 on 2015-09-06 in Miami" do
		results = @miami.angle_to_zenith_at_time(2015, 9, 6, 8, 35, -4)
		expect(results[:angle_to_zenith_at_time].to_deg).to be_within(0.2).of(70)
	end

	it "should calculate time to 70deg from zenith on 2015-09-06 in Sydney" do
		results = @sydney.time_to_angle_from_zenith(2015, 9, 6, +10, 70)
		expect(results[:time_to_angle_from_zenith].to_s).to eql("07:51")
		expect(results[:opposite_time_to_angle_from_zenith].to_s).to eql("15:56")
	end

	it "should calculate angle from zenith of 70deg at 7:51 on 2015-09-06 in Sydney" do
		results = @sydney.angle_to_zenith_at_time(2015, 9, 6, 7, 51, +10)
		expect(results[:angle_to_zenith_at_time].to_deg).to be_within(0.1).of(70)
	end

	it "should return that the sun will never reach 47deg from zenith on 2015-09-06 in Edmonton" do
		results = @edmonton.time_to_angle_from_zenith(2015, 9, 6, -6, 47)
		expect(results[:time_to_angle_from_zenith].to_s).to eql("The sun will not reach 47 degrees from zenith today.")
		expect(results[:opposite_time_to_angle_from_zenith].to_s).to eql("The sun will not reach 47 degrees from zenith today.")
	end

	it "should return that the sun will never reach 19.3deg from zenith on 2015-09-06 in Miami" do
		results = @miami.time_to_angle_from_zenith(2015, 9, 6, -6, 19.3)
		expect(results[:time_to_angle_from_zenith].to_s).to eql("The sun will not reach 19.3 degrees from zenith today.")
		expect(results[:opposite_time_to_angle_from_zenith].to_s).to eql("The sun will not reach 19.3 degrees from zenith today.")		
	end
end

