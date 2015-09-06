require 'spec_helper'

describe "MeanObliqueEclipticCommand" do
	it "should execute on 2014-12-01" do
		@result = {julian_century:0.149125142596397}
		SolCal::Commands::MeanObliqueEclipticCommand.new(@result).execute
		expect(@result[:mean_oblique_ecliptic]).to be_within(0.001).of(23.43735)
	end

	it "should execute on 2015-08-05" do
		@result = {julian_century:0.15592060232717317}
		SolCal::Commands::MeanObliqueEclipticCommand.new(@result).execute
		expect(@result[:mean_oblique_ecliptic]).to be_within(0.001).of(23.43735)
	end
end
