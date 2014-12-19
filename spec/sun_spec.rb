require 'spec_helper'

describe "Sun" do

	before :each do
		@julian_century = 0.149125142596397
		@latitude = SolCal::Angle.from_deg(53.5333)
		@longitude = SolCal::Angle.from_deg(-113.5)
		@time_zone = -7
		@date = Date.new(2014,12,1)
	end

	it "should calculate the eccent of earth's orbit" do
		expect(SolCal::Sun.eccent_earth_orbit(@julian_century)).to be_within(0.000001).of(0.016702)
	end

	it "should calculate the sun's true anomoly" do
		expect(SolCal::Sun.true_anomoly(SolCal::Angle.from_deg(5725.893), -1.092)).to be_within(0.001).of(BigDecimal.new(5724.801,9))
	end

	it "should calculate the sun's radian vector" do
		expect(SolCal::Sun.rad_vector(BigDecimal.new(0.016702,9), SolCal::Angle.from_deg(5725.893))).to be_within(0.001).of(0.986261)
	end

	it "should calculate the interesting daylight information" do
		daylight = SolCal::Sun.daylight(@latitude, @longitude, @time_zone, @date)
		expect(daylight[:sunrise]).to be_within(0.001).of(0.351985)
		expect(daylight[:sunset]).to be_within(0.001).of(0.679877)
		expect(daylight[:duration]).to be_within(1).of(472.16513)
	end
end
