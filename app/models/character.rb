class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	before_create	:race_into_subrace
	#require "../controllers/params.rb"
	
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
###
# Seperates race into :race and :subrace
###
	def race_into_subrace 
	
		race = self.race
		case race
		when 'dwarf_hill'
			@character[:race] = "dwarf"
			@character[:subrace] = "hill"
		when 'dwarf_mountain'
			@character[:race] = "dwarf"
			@character[:subrace] = "mountain"
		when 'elf_high'
			@character[:race] = "elf"
			@character[:subrace] = "high"
		when 'elf_wood'
			@character[:race] = "elf"
			@character[:subrace] = "wood"
		when 'halfling_lightfoot'
			@character[:race] = "halfling"
			@character[:subrace] = "lightfoot"
		when 'halfling_stout'
			@character[:race] = "halfling"
			@character[:subrace] = "stout"
		end
	end
end
