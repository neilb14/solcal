require 'spec_helper'

describe "Sun" do
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
		expect(SolCal::Sun.geometric_mean_long_in_deg(0.14912514)).to be_within(0.0001).of(249.0864)
	end

	it "should calculate the geometric mean anomoly" do
		expect(SolCal::Sun.geometric_mean_anom_in_deg(0.14912514)).to be_within(0.001).of(5725.893)
	end

	it "should calculate the eccent of earth's orbit" do
		expect(SolCal::Sun.eccent_earth_orbit(0.14912514)).to be_within(0.000001).of(0.016702)
	end

	it "should calculate the sun's equation of center" do
		expect(SolCal::Sun.equation_of_center(0.149125142596397, SolCal::Angle.from_deg(5725.89261441308))).to be_within(0.00001).of(-1.09204)
	end

	it "should calculate the sun's true longitude" do
		expect(SolCal::Sun.true_longitude(249.0864,-1.092)).to be_within(0.0001).of(247.9944)
	end
end
