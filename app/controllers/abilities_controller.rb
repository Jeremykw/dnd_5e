class AbilitiesController < ApplicationController	
	
	def create
		@character = Character.find(character_id_params)	
		if @character.create_ability(ability_params).invalid?
			flash[:notice] = "#{@character.character_name}'s six statistics must be numbers between 3 and 20"
			redirect_to new_character_ability_path(@character.id)
		else
			redirect_to new_character_skill_path(@character)
		end
	end

	def new				
		if !@character = Character.find(character_id_params) # Redirect to indext if character not found
			flash[:notice] = "Charcter record does not exits"
			redirect_to character_index_path and return
		end		
		@recomended_ability = Ability.recomended_abilities(@character.character_class) # Ability sujestions based on class
		params[:new_ability] = 1
	end

	###
	# Strong Params
	###
	def character_id_params
		params.require(:character_id)
	end
	
	def ability_params
		params.require(:ability).permit(:str, :dex, :con, :int, :wis, :char)
	end
end

