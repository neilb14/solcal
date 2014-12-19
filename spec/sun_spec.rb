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

	it "should calculate the sun's equation of center" do
		expect(SolCal::Sun.equation_of_center(@julian_century, SolCal::Angle.from_deg(5725.89261441308))).to be_within(0.00001).of(-1.09204)
	end

	it "should calculate the sun's true anomoly" do
		expect(SolCal::Sun.true_anomoly(SolCal::Angle.from_deg(5725.893), -1.092)).to be_within(0.001).of(BigDecimal.new(5724.801,9))
	end

	it "should calculate the sun's radian vector" do
		expect(SolCal::Sun.rad_vector(BigDecimal.new(0.016702,9), SolCal::Angle.from_deg(5725.893))).to be_within(0.001).of(0.986261)
	end

	it "should calculate the mean oblique eciptic" do
		expect(SolCal::Sun.mean_oblique_ecliptic(@julian_century)).to be_within(0.001).of(23.43735)
	end

	it "should calculate the oblique correction" do
		expect(SolCal::Sun.oblique_correction(@julian_century, 23.43735).to_deg).to be_within(0.001).of(23.4349)
	end

	it "should calculate the right ascension" do
		expect(SolCal::Sun.right_ascension(SolCal::Angle.from_deg(247.99), SolCal::Angle.from_deg(23.4349)).to_deg).to be_within(0.001).of(-113.777)
	end

	it "should calculate the equation of time" do
		expect(SolCal::Sun.equation_of_time(0.043018,SolCal::Angle.from_deg(250.072),SolCal::Angle.from_deg(5726.878),0.016702)).to be_within(0.0001).of(11.0596)
	end

	it "should calculate the interesting daylight information" do
		daylight = SolCal::Sun.daylight(@latitude, @longitude, @time_zone, @date)
		expect(daylight[:sunrise]).to be_within(0.001).of(0.351985)
		expect(daylight[:sunset]).to be_within(0.001).of(0.679877)
		expect(daylight[:duration]).to be_within(1).of(472.16513)
	end
end
