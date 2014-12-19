require 'spec_helper'

describe "EccentEarthOrbitCommand" do
	before :each do
		@result = {julian_century:0.149125142596397}
		@command = SolCal::Commands::EccentEarthOrbitCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:eccent_earth_orbit]).to be_within(0.000001).of(0.016702)
	end
end
