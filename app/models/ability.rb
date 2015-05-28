class Ability < ActiveRecord::Base
	belongs_to :character
	before_create :add_racial_ability_modifyer
	#valadateions
	stats = :str, :dex, :con, :int, :wis, :char
	validates_presence_of stats
	validates_numericality_of stats, only_integer: true, greater_than: 2, less_than: 21

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