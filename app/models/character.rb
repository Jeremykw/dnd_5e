class Character < ActiveRecord::Base
	
	
	def racial_traits(race)
		case race
		when "elf"

		when "dwarf"

		when "halfling"

		when "human"

		end
	end

	def subracial_traits(subrace)

	end

end
