class AbilitiesController < ApplicationController	
	require "params.rb"

	def create
		@character = Character.find(character_id_params)
		@character.create_ability(ability_params)
		redirect_to character_path(character_id_params)
	end
	def new
		@character = Character.find(character_id_params)
# Redirect to indext if character not found
		if !@character 
			flash[:notice] = "Charcter record does not exits"
			redirect_to character_index_path
		end
# Ability sujestions based on class
		if @character.character_class == "fighter"
			@recomended_ability = [15, 13, 14, 8, 10, 12]
		elsif @character.character_class == "cleric"
			@recomended_ability = [13, 8, 14, 10, 15, 12]
		elsif @character.character_class == "rouge"
			@recomended_ability = [12, 15, 10, 14, 8, 13]
		elsif @character.character_class == "wizard"
			@recomended_ability = [8, 13, 14, 15, 10, 12]
		end
		params[:new_ability] = 1
	end
end


def ability_params
	params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char)
end

def character_id_params
	params.require(:character_id)
end

