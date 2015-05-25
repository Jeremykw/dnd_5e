class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	has_one :skill
	has_one :background

	before_create :race_into_subrace

	CLASS_LIST = :validate_classes_list

	validates :character_name, :presence => true,
														 :length => { :maximum => 50 }
	validates :level, :presence => true,
								 		:numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 20 }
	validates :character_class, :presence => true,
															:inclusion => { in: CLASS_LIST }
	validates :race, :presence => true,
															:inclusion => { in: ["dwarf", "elf", "halfling", "human"] }
	# validates :subrace, :inclusion => { in: hill mountain high wood lightfoot stout }																												
	validates :xp, :presence => true,
								 :numericality => { :only_integer => true, :greater_then_or_equal_to => 0, :less_than_or_equal_to => 355000 }
	validates :player_name, :presence => true,
													:length => { :maximum => 50 }

###
# Seperates race into :race and :subrace
###
	def race_into_subrace 
	
		# race = self.race
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

	###
	# Array's to fill select tages in character#new
	###
	def self.alignment_choices
		[['Lawful good', 'lg'], ['Neutral good', 'ng'], ['Chaotic good', 'cg'], ['Lawful neutral', 'ln'], ['Neutral', 'n'], ['Chaotic neutral', 'cn'], ['Lawful evil', 'le'], ['Neutral evil', 'ne'], ['Chaotic evil', 'ce']]
	end

	def self.background_choices
		[['Acolyte', 'acolyte'], ['Criminal', 'criminal'], ['Folk Hero', 'folk_hero'], ['Noble', 'noble'], ['Sage', 'sage'], ['Soldier', 'soldier']]
	end

	###
	# Array of races
	###	
	RACE_CHOICE_LIST = [['Dwarf, Hill', 'dwarf_hill'], ['Dwarf, Mountain', 'dwarf_mountain'], ['Elf, High', 'elf_high'], ['Elf, Wood', 'elf_wood'], ['Halfling, Lightfoot', 'halfling_lightfoot'], ['Halfling, Stout', 'halfling_stout'], ['Human', 'human'], ]

	def validate_races_list
		races = []
		RACE_CHOICE_LIST.each do |c|
			races << c[1]
		end
		races
	end
	###
	# Array of classes
	###
	CLASS_CHOICE_LIST = [['Fighter', 'fighter'], ['Cleric', 'cleric'], ['Rouge', 'rouge'], ['Wizard', 'wizard']]
	# creates array of classes for class validation
	def validate_classes_list
		classes = []
		CLASS_CHOICE_LIST.each do |c|
			classes << c[1]
		end
		classes
	end
	###
end

