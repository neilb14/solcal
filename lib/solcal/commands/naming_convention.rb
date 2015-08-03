module SolCal
	module Commands
		module NamingConvention
			def key
				self.class.name.split('::').last
								.gsub(/Command$/, '')
								.gsub(/::/, '/')
								.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
								.gsub(/([a-z\d])([A-Z])/,'\1_\2')
								.tr("-", "_").downcase.to_sym
			end

			def get_classname_from(variable_name)
				parts = variable_name.to_s.split('_')
				parts.map!{|n| n.capitalize }
				name = parts.join('')
				"SolCal::Commands::#{name}Command"
			end
		end
	end
end