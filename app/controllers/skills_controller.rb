class SkillsController < ApplicationController
	def new
		@character ||= Character.find(character_id_params)
	end
	
	def create
		@character = Character.find(character_id_params)
		@character.create_skill(skill_params)
		redirect_to character_path @character
	end
	def skill_params
		params.require(:skill).permit(:acrobatics, :animal_handling, :arcana, :athletics, :deception, :history, :insight, :intimidation, :investigation, :medicine, :nature, :perception, :perforamance, :persuasion, :religion, :sleight_of_hand, :stealth, :survival)
	end
end

