require 'spec_helper'

describe "SolarNoonCommand" do
	before :each do
		@result = {longitude:SolCal::Angle.from_deg(-113.5), time_zone:-7}
		@command = SolCal::Commands::SolarNoonCommand.new(@result)
	end

	it "should execute" do
		@result[:equation_of_time] = 11.059588
		@command.execute
		expect(@result[:solar_noon]).to be_within(0.0001).of(0.515931)
	end

	it "should execute with a big decimal" do
		@result[:equation_of_time] = BigDecimal.new("10.98306")
		@command.execute
		expect(@result[:solar_noon]).to be_within(0.0001).of(0.515984)
	end
end
