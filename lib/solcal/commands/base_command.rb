module SolCal
	module Commands
		class BaseCommand
			def initialize(data)
				@data = data
			end

			def method_missing(name, *args, &block)
				return @data[name.to_sym] if @data[name.to_sym]
				raise "Not Implemented [#{name}]"
			end

			def execute
				@data[key] = self.do_execute
			end

			def key
				self.class.name.split('::').last
								.gsub(/Command$/, '')
								.gsub(/::/, '/')
								.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
								.gsub(/([a-z\d])([A-Z])/,'\1_\2')
								.tr("-", "_").downcase.to_sym
			end
		end
	end
end