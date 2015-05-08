class SkillsController < ApplicationController
	def new
		@character ||= Character.find(character_id_params)
	end
	
	def create
		@character = Character.find(character_id_params)
		skill_hash
		@character.create_skill(@skills)
		redirect_to character_path @character
	end

	# Creates hash appropriate for create Skill from skill_params array
	def skill_hash
		skill_params.map do |skill|
			@skills ||= {}
			@skills[skill] = true
		end
	end

	def skill_params
		params.require(:skill)
	end
end

