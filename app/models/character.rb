class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	has_one :skill
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
			self[:race] = "dwarf"
			self[:subrace] = "hill"
		when 'dwarf_mountain'
			self[:race] = "dwarf"
			self[:subrace] = "mountain"
		when 'elf_high'
			self[:race] = "elf"
			self[:subrace] = "high"
		when 'elf_wood'
			self[:race] = "elf"
			self[:subrace] = "wood"
		when 'halfling_lightfoot'
			self[:race] = "halfling"
			self[:subrace] = "lightfoot"
		when 'halfling_stout'
			self[:race] = "halfling"
			self[:subrace] = "stout"
		end
	end
end
