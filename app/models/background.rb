class Background < ActiveRecord::Base
	belongs_to :character

	###
	# Create character background so that skills can 
	# access background skill options before background
	# choces are made
	###
	def self.create_background(character)
		case character.past
		when "acolyte"
			Acolyte.create(:character_id => character.id)
		when "criminal"
			Criminal.create(:character_id => character.id)
		when "folk_hero"
			FolkHero.create(:character_id => character.id)
		when "noble"
			Noble.create(:character_id => character.id)
		when "sage"
			Sage.create(:character_id => character.id)
		when "soldier"
			Soldier.create(:character_id => character.id)
		end	
	end
end
