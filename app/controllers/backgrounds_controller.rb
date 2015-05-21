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
		
		# Redirect to index if character not found
		if !@character = Character.find(character_id_params)
			flash[:notice] = "Charcter record does not exits"
			redirect_to character_index_path
		end
		if @character.skill # Hash with skill ability dependancy; Skill.rb
			@skill_ability = @character.skill.skill_ability 
		end

	end

	def edit

	end

	def update

	end

	def destroy

	end

	###
	# Strong Params
	###


	def character_id_params
		params.require(:character_id)
	end

end

