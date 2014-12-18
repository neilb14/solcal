module SolCal
	module Commands
		class BaseCommand
			include NamingConvention

			def initialize(data)
				@data = data
			end

			def method_missing(name, *args, &block)
				return @data[name.to_sym] if @data[name.to_sym]
				create_command(name).execute
			end

			def execute
				@data[key] = self.do_execute
			end

			protected
			def create_command(name)
				Object.const_get(get_classname_from(name)).new(@data)
			end
		end
	end
end