class SkillsController < ApplicationController
	def new
		@character = Character.find(character_id_params)
	end
end

