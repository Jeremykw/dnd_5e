module BackgroundsHelper
	def background_suggestion(character)
		backgrounds = [character.background.personality_suggestion]
		backgrounds << character.background.ideal_suggestion
		backgrounds << character.background.bond_suggestion
		backgrounds << character.background.flaw_suggestion
	end
end