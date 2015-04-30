class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	
	
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
