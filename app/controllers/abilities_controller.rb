class AbilitiesController < ApplicationController	
	require "params.rb"

	def create
		@character = Character.find(character_id_params)
		
		if @character.create_ability(ability_params).invalid?
			flash[:notice] = "#{@character.character_name}'s six statistics must be numbers between 3 and 20"
			redirect_to new_character_ability_path(@character.id)
		else
			add_racial_ability_modifyer
			@character.save
			redirect_to character_path(character_id_params)
		end
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

###
# Strong Parameters
###

def ability_params
	params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char)
end

def character_id_params
	params.require(:character_id)
end


def add_racial_ability_modifyer

	case @character.subrace
	when "mountain"
		# +2 str
		# +2 con
	when "hill"
		# +1 wis
		# +2 con
	when "high"
		# +2 dex
		# +1 int
	when "wood"
		# +2 dex
		# +1 wis
	when "lightfoot"
		# +1 char
	when "stout"
		# +1 con, 
	when nil
		#+1 everything
	end

end
