require 'spec_helper'

describe "Angle" do
	it "should return radian value of angle" do
		expect(SolCal::Angle.from_deg(10).to_rad).to be_within(0.1).of(10*180/Math::PI)
		expect(SolCal::Angle.from_deg(45).to_rad).to be_within(0.1).of(45*180/Math::PI)
		expect(SolCal::Angle.from_deg(93).to_rad).to be_within(0.1).of(93*180/Math::PI)
		expect(SolCal::Angle.from_rad(1.0).to_rad).to be_within(0.001).of(1.0)
		expect(SolCal::Angle.from_rad(2.2).to_rad).to be_within(0.001).of(2.2)
	end
end
