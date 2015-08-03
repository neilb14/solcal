module SolCal
	module Commands
		class BaseCommand
			include NamingConvention

			def initialize(data)
				@data = data
			end

			def method_missing(name, *args, &block)
				return @data[name.to_sym] if @data[name.to_sym]
				Commands.run(name, @data)
			end

			def execute
				@data[key] = self.do_execute
			end
		end
	end
end