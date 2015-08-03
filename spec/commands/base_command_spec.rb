require 'spec_helper'

module SolCal
	module Commands
		class LiteralCommand < BaseCommand
			protected
			def do_execute
				14
			end
		end
	end
end

module SolCal
	module Commands
		class AdditionCommand < BaseCommand
			protected
			def do_execute
				literal + 3
			end
		end
	end
end

describe "BaseCommand" do
	before :each do
		@results = {}
	end

	it "should convert class name to key" do
		expect(SolCal::Commands::LiteralCommand.new(@results).key).to be(:literal)
	end

	it "should store the result of command in the results hash" do
		SolCal::Commands::LiteralCommand.new(@results).execute
		expect(@results[:literal]).to eql(14)
	end

	it "should instantiate and execute the specified command when the result is not set" do
		SolCal::Commands::AdditionCommand.new(@results).execute
		expect(@results[:addition]).to eql(17)
	end
end
