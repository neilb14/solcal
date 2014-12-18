require 'spec_helper'

module SolCal
	module Commands
		class HappyHappyCommand
			include NamingConvention
		end

		class TestCommand
			include NamingConvention
		end
	end
end


describe "NamingConvention" do
	before :each do
		@results = {}
	end

	it "should convert class name to key" do
		expect(SolCal::Commands::TestCommand.new.key).to be(:test)
		expect(SolCal::Commands::HappyHappyCommand.new.key).to be(:happy_happy)
	end

	it "should convert variable name to class name" do
		expect(SolCal::Commands::TestCommand.new.get_classname_from("test")).to eql("SolCal::Commands::TestCommand")
		expect(SolCal::Commands::TestCommand.new.get_classname_from("happy_happy")).to eql("SolCal::Commands::HappyHappyCommand")
	end

	it "should convert symbol to class name" do
		expect(SolCal::Commands::TestCommand.new.get_classname_from(:test)).to eql("SolCal::Commands::TestCommand")
		expect(SolCal::Commands::TestCommand.new.get_classname_from(:happy_happy)).to eql("SolCal::Commands::HappyHappyCommand")
	end
end
