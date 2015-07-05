class Character < ActiveRecord::Base
	Dir['app/models/klasses/*.rb'].each {|file| require_dependency file }

	belongs_to :user
	
	has_one :ability, dependent: :destroy
	has_one :skill, dependent: :destroy
	has_one :background, dependent: :destroy
	has_many :items, through: :belongings
	has_many :belongings, dependent: :destroy
	
	before_validation :race_into_subrace, on: :create
	###
	# Lists of choices for character#new select boxes and validation
	###
	CLASS_LIST = [ 'fighter', 'rouge', 'wizard', 'cleric' ]	
	RACE_SUBRACE_LIST = [ 'dwarf_hill', 'dwarf_mountain', 'elf_high', 'elf_wood', 'halfling_lightfoot', 'halfling_stout', 'human']
	RACE_LIST = [ 'human', 'dwarf', 'elf', 'halfling' ]
	SUBRACE_LIST = ['hill', 'mountain', 'high', 'wood', 'lightfoot', 'stout', 'human']	
	ALIGNMENT_LIST = [ 'lg', 'ng', 'cg', 'ln', 'n', 'cn', 'le', 'ne', 'ce' ]
	BACKGROUND_LIST = [ 'acolyte', 'criminal', 'folk_hero', 'noble', 'sage', 'soldier' ]

	validates :character_name, :presence => true, :length => { :maximum => 50 }
	validates :level, :presence => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 1, :less_than_or_equal_to => 20 }
	validates :character_class, :presence => true, :inclusion => { in: CLASS_LIST }
	validates :race, :presence => true, :inclusion => { in: RACE_LIST }
	validates :subrace, :inclusion => { in: SUBRACE_LIST }
	validates :past, :presence => true, :inclusion => { in: BACKGROUND_LIST }
	validates :alignment, :presence => true, :inclusion => { in: ALIGNMENT_LIST }
	validates :xp, :presence => true, :numericality => { :only_integer => true, :greater_then_or_equal_to => 0, :less_than_or_equal_to => 355000 }
	validates :player_name, :presence => true, :length => { :maximum => 50 }

	###
	# Create Character by Class
	###
	def self.create_character(char, user)
		character = char.merge( :user_id => user )
		case character[:character_class]
		when "fighter"
			@character = Fighter.create(character)
		when "cleric"
			@character = Cleric.create(character)
		when "rouge"
			@character = Rouge.create(character)
		when "wizard"
			@character = Wizard.create(character)
		end
		@character
	end

	###
	# Seperates race into :race /subrace
	###
	def race_into_subrace 
		case self.race_subrace
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
		when 'human'
			self[:race] = 'human'
			self[:subrace] = 'human'
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

