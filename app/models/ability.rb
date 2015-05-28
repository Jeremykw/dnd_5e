class Ability < ActiveRecord::Base
	belongs_to :character
	before_create :add_racial_ability_modifyer
	#valadateions
	stats = :str, :dex, :con, :int, :wis, :char
	validates_presence_of stats
	validates_numericality_of stats, only_integer: true, greater_than: 2, less_than: 21

###
# Load abilities into array for Edit or New forms
###
	def self.recomended_abilities(klass) # For Character#new
		case klass
		when "fighter"
			@abilities_array = [15, 13, 14, 8, 10, 12]
		when "cleric"
			@abilities_array = [13, 8, 14, 10, 15, 12]
		when "rouge"
			@abilities_array = [12, 15, 10, 14, 8, 13]
		when "wizard"
			@abilities_array = [8, 13, 14, 15, 10, 12]
		end		
	end

	def ability_array # For Character#edit
		@abilities_array = [str, dex, con, int, wis, char]
	end
	
###
# Add Racial abbility modifiers befor saving
###
	def add_racial_ability_modifyer		
		subrace = Character.find(self.character_id).subrace
		case subrace
		when "mountain"
			self.str += 2 # +2 str
			self.con += 2 # +2 con
		when "hill"
			self.wis += 1 # +1 wis
			self.con += 2 # +2 con
		when "high"
			self.dex += 2 # +2 dex
			self.int += 1 # +1 int
		when "wood"
			self.dex += 2 # +2 dex
			self.wis += 1 # +1 wis
		when "lightfoot"
			self.char += 1 # +1 char
		when "stout"
			self.con += 1# +1 con
		when nil # Human, does not have a sub class
			self.str += 1
			self.dex += 1 
			self.con += 1
			self.int += 1
			self.wis += 1
			self.char += 1
		end
	end
end