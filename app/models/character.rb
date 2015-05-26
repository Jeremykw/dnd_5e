class Character < ActiveRecord::Base
	has_one :ability, dependent: :destroy
	has_one :skill
	has_one :background

	before_create :race_into_subrace
	###
	# Lists of choices for character#new select boxes and validation
	###
	CLASS_CHOICE_LIST = [['Fighter', 'fighter'], ['Cleric', 'cleric'], ['Rouge', 'rouge'], ['Wizard', 'wizard']]
	RACE_CHOICE_LIST = [['Dwarf, Hill', 'dwarf_hill'], ['Dwarf, Mountain', 'dwarf_mountain'], ['Elf, High', 'elf_high'], ['Elf, Wood', 'elf_wood'], ['Halfling, Lightfoot', 'halfling_lightfoot'], ['Halfling, Stout', 'halfling_stout'], ['Human', 'human'], ]
	ALIGNMENT_CHOICE_LIST = [['Lawful good', 'lg'], ['Neutral good', 'ng'], ['Chaotic good', 'cg'], ['Lawful neutral', 'ln'], ['Neutral', 'n'], ['Chaotic neutral', 'cn'], ['Lawful evil', 'le'], ['Neutral evil', 'ne'], ['Chaotic evil', 'ce']]
	BACKGROUND_CHOICE_LIST = [['Acolyte', 'acolyte'], ['Criminal', 'criminal'], ['Folk Hero', 'folk_hero'], ['Noble', 'noble'], ['Sage', 'sage'], ['Soldier', 'soldier']]
	SUBRACE_LIST = ['hill', 'mountain', 'high', 'wood', 'lightfoot', 'stout', nil]

	def self.validation_list(list)# creates array of classes for class validation from constants
		choice_list = []
		list.each do |c|
			choice_list << c[1]
		end
		choice_list += ['dwarf', 'elf', 'halfling'] if list == RACE_CHOICE_LIST
		choice_list
	end

	validates :character_name, :presence => true,
														 :length => { :maximum => 50 }

	validates :level, :presence => true,
								 		:numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 20 }

	validates :character_class, :presence => true,
															:inclusion => { in: validation_list(CLASS_CHOICE_LIST) }

	validates :race, :presence => true,
									 :inclusion => { in: validation_list(RACE_CHOICE_LIST) }

	validates :subrace, :inclusion => { in: SUBRACE_LIST }

	validates :past, :presence => true,
									 :inclusion => { in: validation_list(BACKGROUND_CHOICE_LIST) }

	validates :alignment, :presence => true,
												:inclusion => { in: validation_list(ALIGNMENT_CHOICE_LIST) }

	validates :xp, :presence => true,
								 :numericality => { :only_integer => true, :greater_then_or_equal_to => 0, :less_than_or_equal_to => 355000 }

	validates :player_name, :presence => true,
													:length => { :maximum => 50 }

###
# Seperates race into :race /subrace
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
	# Decodes alignment abreviation into Full Message for Character#show
	def show_alignment
		align = ""
		ALIGNMENT_CHOICE_LIST.each do |a, b|
			align = a if b == alignment
		end
		align
	end

end

