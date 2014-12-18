require 'spec_helper'

module SolCal
	module Commands
		class TestCommand < BaseCommand
			protected
			def do_execute
				true
			end
		end
	end
end

describe "BaseCommand" do
	before :each do
		@results = {}
		@command = SolCal::Commands::TestCommand.new(@results)
	end

	it "should convert class name to key" do
		expect(@command.key).to be(:test)
	end

	it "should store the result of executing in the results hash" do
		@command.execute
		expect(@results[:test]).to be(true)
	end
end
