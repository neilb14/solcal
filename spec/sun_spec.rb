require 'spec_helper'

describe "Sun" do
	before :each do
		@julian_century = 0.149125142596397
		@latitude = SolCal::Angle.from_deg(53.5333)
		@longitude = SolCal::Angle.from_deg(-113.5)
		@time_zone = -7
		@date = Date.new(2014,12,1)
	end

	it "should calculate the interesting daylight information" do
		daylight = SolCal::Sun.daylight(@latitude, @longitude, @time_zone, @date)
		expect(daylight[:sunrise]).to be_within(0.001).of(0.351985)
		expect(daylight[:sunset]).to be_within(0.001).of(0.679877)
		expect(daylight[:duration]).to be_within(1).of(472.16513)
	end
end
