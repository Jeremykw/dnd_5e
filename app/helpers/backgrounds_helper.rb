module BackgroundsHelper
	def background_suggestion(character)
    if @character.background.personality || @character.background.ideal || @character.background.flaw || @character.background.back_story
      backgrounds = [character.background.personality]
      backgrounds << character.background.ideal
      backgrounds << character.background.bond
      backgrounds << character.background.flaw
      backgrounds << character.background.back_story      
    else
      backgrounds = [character.background.personality_suggestion]
      backgrounds << character.background.ideal_suggestion
      backgrounds << character.background.bond_suggestion
      backgrounds << character.background.flaw_suggestion
    end
	end
end