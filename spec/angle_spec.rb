require 'spec_helper'

describe "Angle" do
	it "should return radian value of angle" do
		expect(SolCal::Angle.from_deg(10).to_rad).to be_within(0.0001).of(BigDecimal.new(0.1745,4))
		expect(SolCal::Angle.from_deg(45).to_rad).to be_within(0.00001).of(BigDecimal.new(0.78539, 5))
		expect(SolCal::Angle.from_deg(93).to_rad).to be_within(0.001).of(BigDecimal.new(1.6231562,4))
		expect(SolCal::Angle.from_rad(1.0).to_rad).to be_within(0.001).of(BigDecimal.new(1.0,4))
		expect(SolCal::Angle.from_rad(2.2).to_rad).to be_within(0.001).of(BigDecimal.new(2.2,4))
	end

	it "should return deg value of angle" do
		expect(SolCal::Angle.from_rad(0.174532925).to_deg).to be_within(0.1).of(BigDecimal.new(10,4))
		expect(SolCal::Angle.from_rad(0.785398163).to_deg).to be_within(0.1).of(BigDecimal.new(45,4))
		expect(SolCal::Angle.from_rad(1.6231562).to_deg).to be_within(0.1).of(BigDecimal.new(93,4))
	end

	it "should normalize large angles" do
		expect(SolCal::Angle.from_deg(5725.893).to_rad).to be_within(0.1).of(99.9)
	end

	it "should divide" do
		expect(SolCal::Angle.from_deg(90).div(2).to_deg).to be_within(0.1).of(45)
	end
end
