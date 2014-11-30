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
end
