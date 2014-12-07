require 'spec_helper'

describe "Sun" do

	before :each do
		@julian_century = 0.149125142596397
	end

	it "should calculate sunrise" do
		expect(SolCal::Sun.rise(0.515675,59.30901)).to be_within(0.01).of(0.35)
	end

	it "should calculate sunset" do
		expect(SolCal::Sun.set(0.515675,59.30901)).to be_within(0.01).of(0.68)
	end

	it "should calculate duration" do
		expect(SolCal::Sun.duration(59.30901)).to be_within(0.01).of(474.47)
	end

	it "should calculate the geometric mean longitude" do
		expect(SolCal::Sun.geometric_mean_long_in_deg(@julian_century)).to be_within(0.0001).of(249.0864)
	end

	it "should calculate the geometric mean anomoly" do
		expect(SolCal::Sun.geometric_mean_anom_in_deg(@julian_century)).to be_within(0.001).of(5725.893)
	end

	it "should calculate the eccent of earth's orbit" do
		expect(SolCal::Sun.eccent_earth_orbit(@julian_century)).to be_within(0.000001).of(0.016702)
	end

	it "should calculate the sun's equation of center" do
		expect(SolCal::Sun.equation_of_center(@julian_century, SolCal::Angle.from_deg(5725.89261441308))).to be_within(0.00001).of(-1.09204)
	end

	it "should calculate the sun's true longitude" do
		expect(SolCal::Sun.true_longitude(249.0864,-1.092)).to be_within(0.0001).of(247.9944)
	end

	it "should calculate the sun's true anomoly" do
		expect(SolCal::Sun.true_anomoly(SolCal::Angle.from_deg(5725.893), -1.092)).to be_within(0.001).of(BigDecimal.new(5724.801,9))
	end

	it "should calculate the sun's radian vector" do
		expect(SolCal::Sun.rad_vector(BigDecimal.new(0.016702,9), SolCal::Angle.from_deg(5725.893))).to be_within(0.001).of(0.986261)
	end

	it "should calculate sun's app longitude" do
		expect(SolCal::Sun.app_longitude(BigDecimal.new("247.9944"), @julian_century)).to be_within(0.01).of(247.99)
	end

	it "should calculate the mean oblique eciptic" do
		expect(SolCal::Sun.mean_oblique_ecliptic(@julian_century)).to be_within(0.001).of(23.43735)
	end

	it "should calculate the oblique correction" do
		expect(SolCal::Sun.oblique_correction(@julian_century, 23.43735)).to be_within(0.001).of(23.4349)
	end

	it "should calculate the right ascension" do
		expect(SolCal::Sun.right_ascension(SolCal::Angle.from_deg(247.99), SolCal::Angle.from_deg(23.4349)).to_deg).to be_within(0.001).of(-113.777)
	end
end
