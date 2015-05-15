class BackgroundsController < ApplicationController	
	
	def show

	end
	
	def create
		# @character = Character.find(character_id_params)
		
		# if @character.create_ability(ability_params).invalid?
		# 	flash[:notice] = "#{@character.character_name}'s six statistics must be numbers between 3 and 20"
		# 	redirect_to new_character_ability_path(@character.id)
		# else
		# 	redirect_to new_character_skill_path(@character)
		# end
	end

	def new
		# @character = Character.find(character_id_params)
		# # Redirect to indext if character not found
		# if !@character 
		# 	flash[:notice] = "Charcter record does not exits"
		# 	redirect_to character_index_path
		# end
		# # Ability sujestions based on class
		# @recomended_ability = Ability.abilities_array(@character)
		# params[:new_ability] = 1
	end

	def edit

	end

	def update

	end

	def destroy

	end

end

