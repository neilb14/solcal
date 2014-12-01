require 'spec_helper'

describe "Angle" do
	it "should get radian representation" do
		expect(SolCal::Angle.from_deg(10).to_rad).to be_within(0.01).of(10*180/Math::PI)
		expect(SolCal::Angle.from_deg(45).to_rad).to be_within(0.01).of(45*180/Math::PI)
		expect(SolCal::Angle.from_deg(90).to_rad).to be_within(0.01).of(90*180/Math::PI)
		expect(SolCal::Angle.from_deg(180).to_rad).to be_within(0.01).of(180*180/Math::PI)
	end
end