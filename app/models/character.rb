class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	has_one :skill
	has_one :background

	before_create :race_into_subrace

	validates_presence_of :level
	validates_numericality_of :level, only_integer: true, greater_than: 0, less_than: 21

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

###
# Calculate proficency bonuse based on level
###
	def proficency_bonuse
		level = self.level
		case level
		when 1..4
			2
		when 5..8
			3
		when 9..12
			4
		when 13..16
			5
		when 17..20
			6
		end
	end
	# Calculates Ability modifier
	def ability_modifier(ability)
		modify = (ability - 10)/2
	end
	
end

